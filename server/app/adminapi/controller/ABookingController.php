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


namespace app\adminapi\controller;


use app\adminapi\controller\BaseAdminController;
use app\adminapi\lists\ABookingLists;
use app\adminapi\logic\ABookingLogic;
use app\adminapi\validate\ABookingValidate;


/**
 * ABooking控制器
 * Class ABookingController
 * @package app\adminapi\controller
 */
class ABookingController extends BaseAdminController
{


    /**
     * @notes 获取列表
     * @return \think\response\Json
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public function lists()
    {
        return $this->dataLists(new ABookingLists());
    }


    /**
     * @notes 添加
     * @return \think\response\Json
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public function add()
    {
        $params = (new ABookingValidate())->post()->goCheck('add');
        $result = ABookingLogic::add($params);
        if (true === $result) {
            return $this->success('添加成功', [], 1, 1);
        }
        return $this->fail(ABookingLogic::getError());
    }


    /**
     * @notes 编辑
     * @return \think\response\Json
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public function edit()
    {
        $params = (new ABookingValidate())->post()->goCheck();
        $result = ABookingLogic::edit($params);
        if (true === $result) {
            return $this->success('编辑成功', ['option' => 'ok'], 1, 1);
        }
        return $this->fail(ABookingLogic::getError());
    }

    // 可更改其中一个或者多个属性
    public function modifyBooking()
    {
        $params = (new ABookingValidate())->post()->goCheck();
        $result = ABookingLogic::modifyBooking($params);
        if (true === $result) {
            return $this->success('修改成功', ['option' => 'ok'], 1, 1);
        }
        return $this->fail(ABookingLogic::getError());
    }


    /**
     * @notes 删除
     * @return \think\response\Json
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public function delete()
    {
        $params = (new ABookingValidate())->post()->goCheck('delete');
        ABookingLogic::delete($params);
        return $this->success('删除成功', ['option' => 'ok'], 1, 1);
    }


    /**
     * @notes 获取详情
     * @return \think\response\Json
     * @author likeadmin
     * @date 2022/10/24 00:47
     */
    public function detail()
    {
        $params = (new ABookingValidate())->goCheck('detail');
        $result = ABookingLogic::detail($params);
        return $this->data($result);
    }


}
