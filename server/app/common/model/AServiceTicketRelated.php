<?php

namespace app\common\model;


use app\common\model\BaseModel;
use app\common\model\AServicePerson;
use app\common\model\AServiceScheduleSetting;
use function Symfony\Component\HttpFoundation\all;
use think\facade\Db;

/**
 * 由放号设置计算出来的号源表， 关联表
 * AServiceTicket , 服务号源表
 *
 * id,  service_time,   service_schedule_setting_id, ...
 *
 * Class AServiceTicketRelated
 * @package app\common\model
 */
class AServiceTicketRelated extends BaseModel
{

    protected $name = 'a_service_ticket_related'; // 关联表


    /**
     * 根据放号设置，在service ticket表中生成号源记录
     * 服务号源表，具体哪一天什么时候能预订。
     * 和schedule_setting表关联，setting表有一条记录新增或者更新时，service_ticket表也要同时更新。
     * @param $scheduleSettingId
     * @return bool
     * @throws \Exception
     */
    public function synchronizeTicketData($scheduleSettingId)
    {
        $scheduleSetting = AServiceScheduleSetting::findOrEmpty($scheduleSettingId);
        if (!$scheduleSetting->id) {
            return false;
        }
        // 根据setting_id, 先删除原来生成的服务时间点
        AServiceTicketRelated::where('service_schedule_setting_id','=',$scheduleSetting->id)->delete();

        if (!$scheduleSetting->enabled) {
            return false;
        }

        $startDateStamp = strtotime($scheduleSetting->start_date);
        $endDateStamp = strtotime($scheduleSetting->end_date);
        $dateSectionSeconds = $endDateStamp - $startDateStamp;
        if ($dateSectionSeconds <= 0) {
            return false;
        }

        $loopDates = $this->datesLoop($startDateStamp, $endDateStamp);
       // print_r($loopDates);

        if (is_array($loopDates) && count($loopDates) > 0) {} else {
            return false;
        }


        $amStamps = $this->getServiceTimeStamps($scheduleSetting->am_start_time, $scheduleSetting->am_end_time, $scheduleSetting->am_service_times);
        $pm1Stamps = $this->getServiceTimeStamps($scheduleSetting->pm1_start_time, $scheduleSetting->pm1_end_time, $scheduleSetting->pm1_service_times);
        $pm2Stamps = $this->getServiceTimeStamps($scheduleSetting->pm2_start_time, $scheduleSetting->pm2_end_time, $scheduleSetting->pm2_service_times);

        // 去掉空值
        $allStamps = array_filter(array_unique(array_merge($amStamps, $pm1Stamps, $pm2Stamps)));
        // print_r($allStamps); exit;
        if (count($allStamps) > 0) {
            // 根据setting_id, 先删除原来生成的服务时间点
            // AServiceTicketRelated::where('service_schedule_setting_id','=',$scheduleSetting->id)->delete();
            // 重新生成服务时间点
            $insertData = [];
            foreach ($loopDates as $serveDate) {
                //print_r($serveDate);
                foreach ($allStamps as $serviceTime) {
                    $insertData[] = [
                        'service_time' => $serveDate . ' ' . $serviceTime,
                        'booking_minutes_delay' => $scheduleSetting->booking_minutes_delay,
                        'service_schedule_setting_id' => $scheduleSetting->id,
                        'service_person_id' => $scheduleSetting->service_person_id
                    ];
                }
                // $insertData[] = ['service_time' => $serviceTime, 'service_schedule_setting_id' => $scheduleSetting->id];
            }

            // print_r($insertData);
             $this->saveAll($insertData);
        }

        return true;
    }

    /**
     * 根据时间段，按次数计算出时间点个数
     * @param $startTime
     * @param $endTime
     * @param $serveNumber
     * @return array
     */
    public function getServiceTimeStamps($startTime, $endTime, $serveNumber)
    {
        $serveNumber = (int) $serveNumber;
        $startStamp = strtotime($startTime);
        $sectionSeconds = strtotime($endTime) - $startStamp;
        if ($serveNumber > 0) {
            $step = floor($sectionSeconds / $serveNumber);
        } else {
            $step = 0;
        }
        $rowsData = [];

        // 有时间跨度，且时间段大于1秒
        if ($sectionSeconds > 0 && $step >= 1) {} else {
            return $rowsData;
        }
        for ($i = 0; $i < $serveNumber; $i ++) {
            $stamp = $startStamp + ($step * $i);
            // $rowsData[] = [date('H:i:s', $stamp), $stamp, $step];
            $rowsData[] = date('H:i:s', $stamp);
        }
        return $rowsData;
    }

    // 循环日期
    public function datesLoop($beginTimeStamp, $endTimeStamp)
    {
        if(!is_numeric($beginTimeStamp)||!is_numeric($endTimeStamp)||($endTimeStamp<=$beginTimeStamp)) {
            return [];
        }
        $tmp=array();
        for($i=$beginTimeStamp;$i<=$endTimeStamp;$i+=(24*3600)){
            $tmp[]= date('Y-m-d',$i);

        }
        return $tmp;
    }

    /**
     * 查询有号的服务人员, 入参： 2022-10-20 ~ 2022-10-30
         select date_add(now(),interval 1 minute);  #在当前时间上加一分钟
     * @notes 查询有号源的服务人员
     *
     * @param $startDateTime, ex: 2022-10-20 12:06:15
     * @param $endDateTime, ex: 2022-10-30 23:59:59
     * @return mixed
     */
    public function queryAvailableServicePersons($startDateTime, $endDateTime, $servicePersonId = '')
    {

        $sql = "select sp.id, sp.name, sp.brief_intro, sp.introduction, sp.avatar, ap.service_time 
                from
                (
                    select t2.service_person_id, group_concat(t2.service_time) as service_time
                      from sn_a_view_service_ticket_related as t2
                      where t2.is_booked IS NULL
                          and '$startDateTime' <= date_add(t2.service_time, interval t2.booking_minutes_delay minute)
                          and t2.service_time <= '$endDateTime'
                    group by t2.service_person_id
              ) as ap /*Available Persons*/
                left join sn_a_service_person as sp on ap.service_person_id = sp.id
    ";

        // 查询单个服务人员的服务时间点时不用group by
        // 当不指定特定servie_person的时候，需要用group by ，简单知道哪天有没有人可以服务
        if ($servicePersonId) {
            // $sql = "select sp.id, sp.name, sp.brief_intro, sp.introduction, sp.avatar, ap.service_time
            $sql = "select ap.service_time 
                from
                (
                    select t2.service_person_id, t2.service_time 
                      from sn_a_view_service_ticket_related as t2
                      where t2.is_booked IS NULL
                          and '$startDateTime' <= date_add(t2.service_time, interval t2.booking_minutes_delay minute)
                          and t2.service_time <= '$endDateTime'
              ) as ap /*Available Persons*/
                left join sn_a_service_person as sp on ap.service_person_id = sp.id
                where ap.service_person_id = '$servicePersonId' 
            ";
        }


//        echo $sql;
        return Db::query($sql);
    }

    /**
     * @description 查询单个服务人员的服务时间
     *   查询单个服务人员的服务时间点时不用group by
      当不指定特定servie_person的时候，需要用group by ，简单知道哪天有没有人可以服务
     * @param $startDateTime
     * @param $endDateTime
     * @param $servicePersonId
     * @return array
     */
    public function queryOnePersonAvailableServiceTime($startDateTime, $endDateTime, $servicePersonId = '')
    {
        if (!$servicePersonId) {
            return [];
        }

        $servicePerson = AServicePerson::findOrEmpty($servicePersonId);
        if (!$servicePerson->id) {
            return [];
        }


        // 查询单个服务人员的服务时间点时不用group by
        // 当不指定特定servie_person的时候，需要用group by ，简单知道哪天有没有人可以服务
        // $sql = "select sp.id, sp.name, sp.brief_intro, sp.introduction, sp.avatar, ap.service_time
        $sql = "select ap.service_time , ap.service_schedule_setting_id
                from
                (
                    select t2.service_person_id, t2.service_time, t2.service_schedule_setting_id 
                      from sn_a_view_service_ticket_related as t2
                      where t2.is_booked IS NULL
                          and '$startDateTime' <= date_add(t2.service_time, interval t2.booking_minutes_delay minute)
                          and t2.service_time <= '$endDateTime'
              ) as ap /*Available Persons*/
                left join sn_a_service_person as sp on ap.service_person_id = sp.id
                where ap.service_person_id = '$servicePersonId' 
                order by ap.service_time asc 
            ";
        $serviceTimeStamps =  Db::query($sql);


//        echo $sql;
        return [
            'servicePerson' => $servicePerson,
             'serviceTimeStamps' => $serviceTimeStamps,
            //'serviceTimeStamps' => array_column($serviceTimeStamps, 'service_time'),
        ];
    }


}
