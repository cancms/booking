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

namespace app\adminapi\logic\auth;


use app\common\model\auth\AAdminToServicePerson;
use app\common\logic\BaseLogic;
use think\facade\Db;


/**
 * AServiceScheduleSetting逻辑
 * Class AServiceScheduleSettingLogic
 * @package app\adminapi\logic
 */
class AAdminToServicePersonLogic extends BaseLogic
{


    // 更新关系， 先删除原有的，再添加新的关系
    public static function saveRelationsForAdmin($adminId, $servicePersonIds = [])
    {
        if (!($adminId && count($servicePersonIds) > 0)) {
            return false;
        }
        // 根据 admin_id, 先删除原来生成的关系
        AAdminToServicePerson::where('admin_id','=', $adminId)->delete();

        $insertData = [];
        foreach ($servicePersonIds as $servicePersonId) {
            $insertData[] = [
                'admin_id' => $adminId,
                'service_person_id' => $servicePersonId,
            ];
        }
        // print_r($insertData);
        // Db::table('a_admin_to_service_person')->saveAll($insertData);
        (new AAdminToServicePerson())->saveAll($insertData);
        return ['option' => 'ok'];
    }





}
