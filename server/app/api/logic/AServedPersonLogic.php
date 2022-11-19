<?php

namespace app\api\logic;


use app\common\model\AServedPerson;
use app\common\logic\BaseLogic;
use think\facade\Db;


/**
 * AServedPerson逻辑
 * Class AServedPersonLogic
 * @package app\api\logic
 */
class AServedPersonLogic extends BaseLogic
{


    // $bookingUserId 当前登录系统的前端用户， sn_user表id
    // 当前登录系统的前端用户帮别人预约
    public static function getServedPersonsList ($bookingUserId) {
        $list = AServedPerson::where('booking_user_id', '=', $bookingUserId)->select()->toArray();
//        print_r($list);
        return $list;
    }

    /**
     * @notes 添加
     * @param array $params
     * @return bool
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public static function add(array $params): bool
    {
        Db::startTrans();
        try {
            AServedPerson::create([
                'real_name' => $params['real_name'],
                'booking_user_id' => $params['booking_user_id'],
                'mobile_phone' => $params['mobile_phone'],
                'note1' => $params['note1'],
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
     * @date 2022/10/21 17:26
     */
    public static function edit(array $params): bool
    {
        Db::startTrans();
        try {
            AServedPerson::update([
                'id' => $params['id'],
                'real_name' => $params['real_name'],
                'booking_user_id' => $params['booking_user_id'],
                'mobile_phone' => $params['mobile_phone'],
                'note1' => $params['note1'],
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
     * @notes 删除
     * @param array $params
     * @return bool
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public static function delete(array $params): bool
    {
        return AServedPerson::destroy($params['id']);
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
        return AServedPerson::findOrEmpty($params['id'])->toArray();
    }
}
