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

namespace app\api\lists\booking;

use app\api\lists\BaseApiDataLists;
use app\common\enum\YesNoEnum;
use app\common\lists\ListsSearchInterface;
use app\common\lists\ListsExtendInterface;
use app\common\model\ABooking;
use app\common\model\AServicePerson;
use app\common\model\AServedPerson;
use think\contract\Arrayable;


/**
 * 文章列表
 * Class ArticleLists
 * @package app\api\lists\article
 */
class ABookingLists extends BaseApiDataLists implements ListsSearchInterface, ListsExtendInterface
{

    // 列表数据缓存
    private array $_listResultData = [];

    /**
     * @notes 搜索条件
     * @return \string[][]
     * @author 段誉
     * @date 2022/9/16 18:54
     */
    public function setSearch(): array
    {
        return [
            // 我的预约
            '=' => ['booking_user_id'] // 当前登录人的id, 前端H5用户user
        ];
    }


    /**
     * @notes 获取预约订单列表, 只能查询三个月以内的数据
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @date 2022/9/16 18:55
     */
    public function lists(): array
    {
        // $this->userId, 当前登录用户的id(session里面)
        $userId = $this->params['userId'] ?? $this->userId;
        $where[] = ['booking_user_id', '=', $userId];
        $field = 'id,
            service_schedule_setting_id,
            booking_user_id,
            service_person_id,
            served_person_id,
            service_time,
            booking_status,
            comment,
            created_at
        ';
        $result = ABooking::field($field)
            ->where($where)
            ->where($this->searchWhere)
            ->order(['id' => 'desc'])
            ->limit($this->limitOffset, $this->limitLength)
            ->select()->toArray();

        // 提供服务人员的id
        $servicePersonIds = array_column($result, 'service_person_id');
        // 被服务人员的id
        $servedPersonIds = array_column($result, 'served_person_id');

        $this->_listResultData['servicePersonIds'] = $servicePersonIds;
        $this->_listResultData['servedPersonIds'] = $servedPersonIds;
        return $result;
    }


    /**
     * @notes 获取预约订单数量
     * @return int
     * @author 段誉
     * @date 2022/9/16 18:55
     */
    public function count(): int
    {
        return ABooking::where($this->searchWhere)->count();
    }

    // extend 接口
    public function extend()
    {
        $result1 = AServicePerson::field('id, name, brief_intro, avatar')
            ->whereIn('id', $this->_listResultData['servicePersonIds'])
            ->select()->toArray();
        $result2 = AServedPerson::field('id, real_name, mobile_phone, note1')
            ->whereIn('id', $this->_listResultData['servedPersonIds'])
            ->select()->toArray();

        return ['servicePersons' => $result1, 'servedPersons' => $result2];
    }
}
