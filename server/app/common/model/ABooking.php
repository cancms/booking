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

namespace app\common\model;


use app\common\model\BaseModel;
use think\facade\Db;

/**
 * ABooking模型
 * Class ABooking
 * @package app\common\model
 */
class ABooking extends BaseModel
{

    protected $name = 'a_booking';


    // join 表查询预约订单详情
    public static function getBookingOrderDetails($bookingOrderId)
    {

        $sql = "select b.id, 
                        b.booking_user_id,
                       b.service_person_id,
                        b.served_person_id,
                        b.service_time,
                        b.booking_status,
                        b.comment,
                        b.created_at,
                        
                        cp.real_name as servedPersonName,
                        cp.mobile_phone as servedPersonPhone,
                        
                        sp.name as servicePersonName,
                        sp.brief_intro as servicePersonBrief,
                        sp.avatar as servicePersonAvatar
                    
            from sn_a_booking as b
                left join sn_a_service_person as sp on b.service_person_id = sp.id
                left join sn_a_served_person as cp on b.served_person_id = cp.id 
            where b.id = '$bookingOrderId'
        ";
        //        echo $sql;
        return Db::query($sql);
    }


}
