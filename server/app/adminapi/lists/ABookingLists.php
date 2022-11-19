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

namespace app\adminapi\lists;


use app\adminapi\lists\BaseAdminDataLists;
use app\common\model\ABooking;
use app\common\lists\ListsSearchInterface;

use think\db\Query;
use think\facade\Db;
/**
 * ABooking列表
 * Class ABookingLists
 * @package app\adminapi\lists
 */
class ABookingLists extends BaseAdminDataLists implements ListsSearchInterface
{

    public function __construct()
    {
        parent::__construct();

        $this->setCustomSearch();
    }

    /**
     * @notes 设置搜索条件
     * @return \string[][]
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public function setSearch(): array
    {
        return [
            // '=' => ['service_schedule_setting_id', 'booking_user_id', 'service_person_id', 'served_person_id', 'booking_time', 'booking_status', 'comment', 'created_at', 'updated_at'],
            '=' => [],

        ];
    }


    private function setCustomSearchBAK ()
    {
        $where = [];
        // 订单号条件
        if (issetNotEmpty($this->params['id'])) {
            $where[] = ['b.id', '=', $this->params['id']];
        }
        // 下单人条件
        if (issetNotEmpty($this->params['booking_user_id'])) {
            $where[] = ['b.booking_user_id', '=', $this->params['booking_user_id']];
        }
        // 提供服务者条件
        if (issetNotEmpty($this->params['service_person_id'])) {
            $where[] = ['b.service_person_id', '=', $this->params['service_person_id']];
        }
        // 订单状态条件
        if (issetNotEmpty($this->params['booking_status'])) {
            $where[] = ['b.booking_status', '=', $this->params['booking_status']];
        }
        // 服务时间条件
        if (issetNotEmpty($this->params['service_time_start']) && issetNotEmpty($this->params['service_time_end']) ) {
            $where[] = ['b.service_time', '>=', $this->params['service_time_start']];
            $where[] = ['b.service_time', '<=', $this->params['service_time_end']];
        }
        // 下单时间条件
        if (issetNotEmpty($this->params['created_at_start']) && issetNotEmpty($this->params['created_at_end']) ) {
            $where[] = ['b.created_at', '>=', $this->params['created_at_start']];
            $where[] = ['b.created_at', '<=', $this->params['created_at_end']];
        }

        $this->searchWhere = $where;
    }

    private function setCustomSearch ()
    {
        $where = [];
        // 订单号条件
        if (issetNotEmpty($this->params['id'])) {
            $where[] = ['id', '=', $this->params['id']];
        }
        // 下单人条件
        if (issetNotEmpty($this->params['booking_user_id'])) {
            $where[] = ['booking_user_id', '=', $this->params['booking_user_id']];
        }
        // 提供服务者条件
        if (issetNotEmpty($this->params['service_person_id'])) {
            $where[] = ['service_person_id', '=', $this->params['service_person_id']];
        }
        // 订单状态条件
        if (issetNotEmpty($this->params['booking_status'])) {
            $where[] = ['booking_status', '=', $this->params['booking_status']];
        }
        // 服务时间条件
        if (issetNotEmpty($this->params['service_time_start']) && issetNotEmpty($this->params['service_time_end']) ) {
            $where[] = ['service_time', '>=', $this->params['service_time_start']];
            $where[] = ['service_time', '<=', $this->params['service_time_end']];
        }
        // 下单时间条件
        if (issetNotEmpty($this->params['created_at_start']) && issetNotEmpty($this->params['created_at_end']) ) {
            $where[] = ['created_at', '>=', $this->params['created_at_start']];
            $where[] = ['created_at', '<=', $this->params['created_at_end']];
        }

        $this->searchWhere = $where;
    }


    /**
     * @notes 获取列表
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public function listsBAK(): array
    {
        return ABooking::where($this->searchWhere)
            ->field(['id', 'service_schedule_setting_id', 'booking_user_id', 'service_person_id', 'served_person_id', 'booking_time', 'booking_status', 'comment', 'created_at', 'updated_at'])
            ->limit($this->limitOffset, $this->limitLength)
            ->order(['id' => 'desc'])
            ->select()
            ->toArray();
    }
    // 连表查询
    public function lists(): array
    {
        $subQuery = Db::table('sn_a_booking')->alias('b')
            ->leftJoin(['sn_a_service_person' => 'sp'],'b.service_person_id = sp.id')
            ->leftJoin(['sn_a_served_person' => 'cp'],'b.served_person_id = cp.id ')
            ->leftJoin(['sn_user' => 'cu'],'b.booking_user_id = cu.id ')
            // ->where($this->searchWhere)
            // ->field(['id', 'service_schedule_setting_id', 'booking_user_id', 'service_person_id', 'served_person_id', 'booking_time', 'booking_status', 'comment', 'created_at', 'updated_at'])
            ->field('b.id,
                            b.booking_user_id,
                            b.service_person_id,
                            b.served_person_id,
                            b.service_time,
                            b.booking_status,
                            b.comment,
                            b.created_at,
                            
                            cu.real_name as madeOrderPersonName,
                            cu.account as madeOrderPersonAccount,

                            cp.real_name as servedPersonName,
                            cp.mobile_phone as servedPersonPhone,
                            
                            sp.name as servicePersonName,
                            sp.brief_intro as servicePersonBrief,
                            sp.avatar as servicePersonAvatar')
            ->limit($this->limitOffset, $this->limitLength)
            // ->order(['id' => 'desc'])
            // ->select() // call the sql query action
        ;
            // ->toArray();
            // ->buildSql();
        $subSql = $subQuery->buildSql();
        // print_r($sql);
        // return $query->select()->toArray(); // call the sql query action
        // return Db::query($sql);


        $orderBy = ['id' => 'desc'];
        // 服务时间条件
        if (issetNotEmpty($this->params['service_time_start']) && issetNotEmpty($this->params['service_time_end']) ) {
            $orderBy = ['service_time' => 'asc'];
        }


        $query = Db::table($subSql . ' t')
            ->where($this->searchWhere)
            ->order($orderBy)
        ;
        // $sql = $query->buildSql();
        // print_r($sql);
        return  $query->select()->toArray();

    }


    /**
     * @notes 获取数量
     * @return int
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public function count(): int
    {
        return ABooking::where($this->searchWhere)->count();
    }

}
