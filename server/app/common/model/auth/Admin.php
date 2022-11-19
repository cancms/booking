<?php
// +----------------------------------------------------------------------
// | likeadmin快速开发前后端分离管理后台（PHP版）
// +----------------------------------------------------------------------
// | 欢迎阅读学习系统程序代码，建议反馈是我们前进的动力
// | 开源版本可自由商用，可去除界面版权logo
// | gitee下载：https://gitee.com/likeshop_gitee/likeadmin
// | github下载：https://github.com/likeshop-github/likeadmin
// | 访问官网：https://www.likeadmin.cn
// | likeadmin团队 版权所有 拥有最终解释权
// +----------------------------------------------------------------------
// | author: likeadminTeam
// +----------------------------------------------------------------------

namespace app\common\model\auth;

use app\common\enum\YesNoEnum;
use app\common\model\BaseModel;
use app\common\model\dept\Dept;
use think\model\concern\SoftDelete;
use app\common\service\FileService;
use think\facade\Db;

class Admin extends BaseModel
{
    use SoftDelete;

    protected $deleteTime = 'delete_time';

    /**
     * @notes 关联角色模型
     * @date 2021/6/30 17:48
     * @return \think\model\relation\HasOne
     * @author lr
     */
    public function role()
    {
        return $this->hasOne(SystemRole::class, 'id', 'role_id')
            ->field('id,name,role_code');
    }


    /**
     * @notes 关联部门
     * @return \think\model\relation\HasOne
     * @author 段誉
     * @date 2022/5/26 11:11
     */
    public function dept()
    {
        return $this->hasOne(Dept::class, 'id', 'dept_id')->bind(['dept_name' => 'name']);
    }


    /**
     * @notes 角色菜单关联
     * @return \think\model\relation\HasMany
     * @author 段誉
     * @date 2022/7/7 12:04
     */
    public function roleMenu()
    {
        return $this->hasMany(SystemRoleMenu::class,'role_id','role_id');
    }



    /**
     * @notes 获取禁用状态
     * @param $value
     * @param $data
     * @return string|string[]
     * @author 令狐冲
     * @date 2021/7/7 01:25
     */
    public function getDisableDescAttr($value, $data)
    {
        return YesNoEnum::getDisableDesc($data['disable']);
    }

    /**
     * @notes 最后登录时间获取器 - 格式化：年-月-日 时:分:秒
     * @param $value
     * @return string
     * @author Tab
     * @date 2021/7/13 11:35
     */
    public function getLoginTimeAttr($value)
    {
        return empty($value) ? '' : date('Y-m-d H:i:s', $value);
    }

    /**
     * @notes 头像获取器 - 头像路径添加域名
     * @param $value
     * @return string
     * @author Tab
     * @date 2021/7/13 11:35
     */
    public function getAvatarAttr($value)
    {
        return empty($value) ? FileService::getFileUrl(config('project.default_image.admin_avatar')) : FileService::getFileUrl(trim($value, '/'));
    }


    // 获取 admin 和 service_person 的关系
    public static function getAdminServicePersonRelations ($adminIds = [])
    {
        $subQuery = Db::table('sn_a_admin_to_service_person')->alias('atsp')
            ->leftJoin(['sn_a_service_person' => 'sp'],'atsp.service_person_id = sp.id')
            ->whereIn('atsp.admin_id', $adminIds)
            ->field('atsp.admin_id,
                            atsp.service_person_id,
                            sp.name as servicePersonName
                            ')
        ;
        // print_r($subQuery->buildSql());
        // call the sql query action
        $resultArray = $subQuery->select() ->toArray();

        $relationMap = []; // adminId => [servicePersonId]
        if ($resultArray && is_array($resultArray)) {
            foreach ($resultArray as $row) {
                if (!isset($relationMap[$row['admin_id']])) {
                    $relationMap[$row['admin_id']] = [];
                }
                $relationMap[$row['admin_id']][] = $row;
            }
        }
        return $relationMap;
    }
}
