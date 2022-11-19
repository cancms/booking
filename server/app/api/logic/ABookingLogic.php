<?php

namespace app\api\logic;


use app\common\model\ABooking;
use app\common\logic\BaseLogic;
use think\facade\Db;


/**
 * ABookingLogic 逻辑
 * Class ABookingLogic
 * @package app\api\logic
 */
class ABookingLogic extends BaseLogic
{


    /**
     * @notes 添加
     * @param array $params
     * @return bool
     * @date 2022/10/24 00:47
     */
    public static function add(array $params): bool
    {
        $nowDateTime = date("Y-m-d H:i:s");
        Db::startTrans();
        try {
            ABooking::create([
                'service_schedule_setting_id' => $params['service_schedule_setting_id'],
                'booking_user_id' => $params['booking_user_id'],
                'service_person_id' => $params['service_person_id'],
                'served_person_id' => $params['served_person_id'],
                'service_time' => $params['service_time'],
                'comment' => $params['comment'],
                'booking_status' => 'pending',
                'created_at' => $nowDateTime ,
                'updated_at' => $nowDateTime,
            ]);

            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            self::setError($e->getMessage());
            return false;
        }
    }
    /**
     * @notes 获取详情
     * @param $params
     * @return array
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public static function detail($params): array
    {
        return ABooking::findOrEmpty($params['id'])->toArray();
    }


    // join 表查询预约订单详情
    public static function orderDetails($bookingOrderId): array
    {
        return ABooking::getBookingOrderDetails($bookingOrderId);
    }


}
