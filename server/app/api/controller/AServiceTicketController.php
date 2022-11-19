<?php

namespace app\api\controller;


//use app\api\lists\article\ArticleCollectLists;
//use app\api\lists\article\ArticleLists;
use app\api\logic\AServiceTicketLogic;

/**
 * 文章管理
 * Class ArticleController
 * @package app\api\controller
 */
class AServiceTicketController extends BaseApiController
{

//    public array $notNeedLogin = ['lists', 'cate', 'detail'];


    /**
     * @notes 可预订服务人员列表
     * @return \think\response\Json
     * @author Tom
     * @date 2022/9/20 15:30
     */
    public function getAvailableServicePersonsList($startDateTime, $endDateTime, $servicePersonId = '')
    {
        $result = AServiceTicketLogic::getAvailableServicePersonsList($startDateTime, $endDateTime, $servicePersonId);
        return $this->data($result);
    }
    public function getOnePersonAvailableServiceTime($startDateTime, $endDateTime, $servicePersonId = '')
    {
        $result = AServiceTicketLogic::getOnePersonAvailableServiceTime($startDateTime, $endDateTime, $servicePersonId);
        return $this->data($result);
    }

}
