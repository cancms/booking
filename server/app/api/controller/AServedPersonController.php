<?php

namespace app\api\controller;


//use app\api\lists\article\ArticleCollectLists;
//use app\api\lists\article\ArticleLists;
use app\api\logic\AServedPersonLogic;

/**
 * 文章管理
 * Class ArticleController
 * @package app\api\controller
 */
class AServedPersonController extends BaseApiController
{

//    public array $notNeedLogin = ['lists', 'cate', 'detail'];


    /**
     * @notes 可用的被服务人员列表
      $bookingUserId 当前登录系统的前端用户， sn_user表id
      当前登录系统的前端用户帮别人预约
     * @return \think\response\Json
     * @date 2022/9/20 15:30
     */
    public function getServedPersonsList($bookingUserId)
    {
        return $this->data(AServedPersonLogic::getServedPersonsList($bookingUserId));
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
        $result = AServedPersonLogic::add($params);
        if (true === $result) {
            return $this->success('添加成功', ['option' => 'ok'], 1, 1);
        }
        return $this->fail(AServedPersonLogic::getError());
    }

    /**
     * @notes 编辑
     * @return \think\response\Json
     * @date 2022/10/21 17:26
     */
    public function edit()
    {
        // $params = (new AServicePersonValidate())->post()->goCheck();
        $params = $this->request->post();
        if ($params['id']) {
            $result = AServedPersonLogic::edit($params);
            if (true === $result) {
                return $this->success('编辑成功', ['option' => 'ok'], 1, 1);
            }
        }
        return $this->fail(AServedPersonLogic::getError());
    }

    /**
     * @notes 删除
     * @return \think\response\Json
     * @date 2022/10/24 00:47
     */
    public function delete()
    {
        $params = $this->request->get();

        // var_dump($params);
        // return false;
        if (!$params['id']) {
            return $this->fail('fail', ['option' => '没有id']);
        }
        AServedPersonLogic::delete($params);
        return $this->success('删除成功', ['option' => 'ok'], 1, 1);
    }

}
