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

namespace app\adminapi\logic;


use app\common\model\AServiceScheduleSetting;
use app\common\model\AServiceTicketRelated;
use app\common\logic\BaseLogic;
use think\facade\Db;


/**
 * AServiceScheduleSetting逻辑
 * Class AServiceScheduleSettingLogic
 * @package app\adminapi\logic
 */
class AServiceScheduleSettingLogic extends BaseLogic
{


    /**
     * @notes 添加
     * @param array $params
     * @return bool
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public static function add(array $params): bool
    {
        Db::startTrans();
        try {
            $settingItem = AServiceScheduleSetting::create([
                'label' => $params['label'],
                'enabled' => $params['enabled'],
                'service_person_id' => $params['service_person_id'],
                'avg_duration' => $params['avg_duration'],
                'booking_fee' => $params['booking_fee'],
                'booking_minutes_delay' => $params['booking_minutes_delay'],
                'start_date' => $params['start_date'],
                'end_date' => $params['end_date'],
                'am_service_times' => $params['am_service_times'],
                'am_start_time' => $params['am_start_time'],
                'am_end_time' => $params['am_end_time'],
                'pm1_service_times' => $params['pm1_service_times'],
                'pm1_start_time' => $params['pm1_start_time'],
                'pm1_end_time' => $params['pm1_end_time'],
                'pm2_service_times' => $params['pm2_service_times'],
                'pm2_start_time' => $params['pm2_start_time'],
                'pm2_end_time' => $params['pm2_end_time'],
            ]);
            if ($settingItem && $settingItem->id) {
                static::synchronizeTicketData($settingItem->id);
            }

            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            self::setError($e->getMessage());
            return false;
        }
    }


    /**
     * @notes 编辑
     * @param array $params
     * @return bool
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public static function edit(array $params): bool
    {
        Db::startTrans();
        try {
            AServiceScheduleSetting::update([
                'id' => $params['id'],
                'label' => $params['label'],
                'enabled' => $params['enabled'],
                'service_person_id' => $params['service_person_id'],
                'avg_duration' => $params['avg_duration'],
                'booking_fee' => $params['booking_fee'],
                'booking_minutes_delay' => $params['booking_minutes_delay'],
                'start_date' => $params['start_date'],
                'end_date' => $params['end_date'],
                'am_service_times' => $params['am_service_times'],
                'am_start_time' => $params['am_start_time'],
                'am_end_time' => $params['am_end_time'],
                'pm1_service_times' => $params['pm1_service_times'],
                'pm1_start_time' => $params['pm1_start_time'],
                'pm1_end_time' => $params['pm1_end_time'],
                'pm2_service_times' => $params['pm2_service_times'],
                'pm2_start_time' => $params['pm2_start_time'],
                'pm2_end_time' => $params['pm2_end_time'],
            ]);
            if ($params['id']) {
                static::synchronizeTicketData($params['id']);
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            self::setError($e->getMessage());
            return false;
        }
    }

    /**
     * 根据放号设置，在service ticket表中生成号源记录
     * 服务号源表，具体哪一天什么时候能预订。
     * 和schedule_setting表关联，setting表有一条记录新增或者更新时，service_ticket表也要同时更新。
     * @return void
     * @throws \Exception
     */
    public static function synchronizeTicketData($scheduleSettingId)
    {
        $serviceTicket = new AServiceTicketRelated();
        $serviceTicket->synchronizeTicketData($scheduleSettingId);
    }


    /**
     * @notes 删除
     * @param array $params
     * @return bool
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public static function delete(array $params): bool
    {

        // 根据setting_id, 先删除原来生成的服务时间点
        if($params['id']) {
            AServiceTicketRelated::where('service_schedule_setting_id','=',$params['id'])->delete();
        }

        return AServiceScheduleSetting::destroy($params['id']);
    }


    /**
     * @notes 获取详情
     * @param $params
     * @return array
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public static function detail($params): array
    {
        return AServiceScheduleSetting::findOrEmpty($params['id'])->toArray();
    }
}
