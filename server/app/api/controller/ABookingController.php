<?php

namespace app\api\controller;


use app\api\lists\booking\ABookingLists;
use app\api\logic\ABookingLogic;

/**
 * 文章管理
 * Class ABookingController
 * @package app\api\controller
 */
class ABookingController extends BaseApiController
{

//    public array $notNeedLogin = ['lists', 'cate', 'detail'];


    /**
     * @notes 预约订单列表
     * @return \think\response\Json
     * @author Tom
     * @date 2022/9/20 15:30
     */
    public function lists()
    {
        return $this->dataLists(new ABookingLists());
    }


    /**
     * @notes 添加
     * @return \think\response\Json
     * @date 2022/10/21 17:26
     */
    public function add()
    {
        // $params = (new AServicePersonValidate())->post()->goCheck('add');
        $params = $this->request->post();
        $result = ABookingLogic::add($params);
        if (true === $result) {
            return $this->success('添加成功', ['option' => 'ok'], 1, 1);
        }
        return $this->fail(ABookingLogic::getError());
    }

    // join 表查询预约订单详情， get
    public function loadOrderDetails($bookingOrderId)
    {
        $result = ABookingLogic::orderDetails($bookingOrderId);
        $detail = $result[0] ?? [];
        return $this->data($detail);
    }


}
