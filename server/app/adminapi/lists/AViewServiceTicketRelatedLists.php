<?php

namespace app\adminapi\lists;


use app\adminapi\lists\BaseAdminDataLists;
// use app\common\model\AServicePerson;
use app\common\lists\ListsSearchInterface;
use app\common\model\AServiceTicketRelated;
use app\common\model\AViewServiceTicketRelated;
use think\facade\Db;


/**
 * AServicePerson列表
 * Class AServicePersonLists
 * @package app\adminapi\lists
 */
class AViewServiceTicketRelatedLists extends BaseAdminDataLists implements ListsSearchInterface
{
    protected bool $_validateParamsCheck = false;

    public function __construct()
    {
        parent::__construct();
        $this->setCustomSearch();
    }

    /**
     * @notes 设置搜索条件
     * @return \string[][]
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public function setSearch(): array
    {
        return [
            '=' => ['service_person_id', 'booking_status'],

            // between 1 and 2, 包括 1 和 2在内, select * from sn_a_service_person where id between 2 and 3
            'between' => 'service_time', // get 传参：  start, end


            // TIME()函数，用于提取时间字段的时间，例如t01的tdate为'2020-05-26 11:11:11'，返回的格式为"HH:ii:ss"
            // select time(tdate) from t01;
            // 返回：11:11:11
            'between_mysql_time' => Db::raw('time(service_time)'), // get 传参： startTime, endTime

        ];
    }

    private function setCustomSearch ()
    {
        // 未预约， 可用的号源
        $isAvailable = $this->request->get('is_available');
        if ($isAvailable == '1') {
            $this->searchWhere[] = Db::raw('is_booked is null');
        } elseif ($isAvailable == '0') {
            $this->searchWhere[] = Db::raw('is_booked is not null');
        }

        // 今天以前的号源无效
        $today = date('Y-m-d'); // 2022-10-20
        $this->searchWhere[] = ['service_time', '>=', $today];

    }


    /**
     * @notes 获取列表
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public function lists(): array
    {
        // return AViewServiceTicketRelated::where($this->searchWhere)
        //     ->field(['id', 'name', 'avatar', 'brief_intro', 'introduction'])
        //     ->limit($this->limitOffset, $this->limitLength)
        //     ->order(['id' => 'desc'])
        //     ->select()
        //     ->toArray();


        $query = Db::table('sn_a_view_service_ticket_related')->alias('b')
            ->leftJoin(['sn_a_service_person' => 'sp'],'b.service_person_id = sp.id')
            ->field('b.service_schedule_setting_id,
                            b.service_person_id,
                            b.service_time,
                            b.booking_minutes_delay,
                            b.is_booked,
                            b.booking_status,
                            
                            sp.name as servicePersonName,
                            sp.avatar as servicePersonAvatar')
            ->limit($this->limitOffset, $this->limitLength)
            ->where($this->searchWhere)
            ->order(['service_time' => 'asc'])
            ;
        $sql = $query->buildSql();
        // showme($sql);
        // showme($this->searchWhere);
        return  $query->select()->toArray();
    }


    /**
     * @notes 获取数量
     * @return int
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public function count(): int
    {
        $query = AViewServiceTicketRelated::where($this->searchWhere);
        // $sql = $query->buildSql();
        // showme($this->searchWhere);
        // showme($sql);


        return $query->count();
        // return 0;
    }

}
