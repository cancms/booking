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


use app\common\model\ABooking;
use app\common\logic\BaseLogic;
use think\facade\Db;


/**
 * ABooking逻辑
 * Class ABookingLogic
 * @package app\adminapi\logic
 */
class ABookingLogic extends BaseLogic
{


    /**
     * @notes 添加
     * @param array $params
     * @return bool
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public static function add(array $params): bool
    {
        Db::startTrans();
        try {
            ABooking::create([
                'service_schedule_setting_id' => $params['service_schedule_setting_id'],
                'booking_user_id' => $params['booking_user_id'],
                'service_person_id' => $params['service_person_id'],
                'served_person_id' => $params['served_person_id'],
                'service_time' => $params['service_time'],
                'booking_status' => $params['booking_status'],
                'comment' => $params['comment'],
                'created_at' => $params['created_at'],
                'updated_at' => $params['updated_at'],
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
     * @notes 编辑
     * @param array $params
     * @return bool
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public static function edit(array $params): bool
    {
        Db::startTrans();
        try {
            ABooking::update([
                'id' => $params['id'],
                'service_schedule_setting_id' => $params['service_schedule_setting_id'],
                'booking_user_id' => $params['booking_user_id'],
                'service_person_id' => $params['service_person_id'],
                'served_person_id' => $params['served_person_id'],
                'service_time' => $params['service_time'],
                'booking_status' => $params['booking_status'],
                'comment' => $params['comment'],
                'created_at' => $params['created_at'],
                'updated_at' => $params['updated_at'],
            ]);

            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            self::setError($e->getMessage());
            return false;
        }
    }

    // 可更改其中一个或者多个属性
    public static function modifyBooking(array $params): bool
    {
        $updateData = ['id' => $params['id']];
        $fields = [
            'service_schedule_setting_id',
            'booking_user_id',
            'service_person_id',
            'served_person_id',
            'service_time',
            'booking_status',
            'comment',
            'created_at',
            'updated_at'
        ];
        foreach ($fields as $field) {
            if (isset($params[$field])) {
                $updateData[$field] = $params[$field];
            }
        }

        Db::startTrans();
        try {
            ABooking::update($updateData);
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            self::setError($e->getMessage());
            return false;
        }
    }


    /**
     * @notes 删除
     * @param array $params
     * @return bool
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public static function delete(array $params): bool
    {
        return ABooking::destroy($params['id']);
    }


    /**
     * @notes 获取详情
     * @param $params
     * @return array
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public static function detail($params): array
    {
        return ABooking::findOrEmpty($params['id'])->toArray();
    }
}
