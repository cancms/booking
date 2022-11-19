<?php

namespace app\api\logic;

use app\common\enum\YesNoEnum;
use app\common\logic\BaseLogic;
use app\common\model\AServiceTicketRelated;
//use app\common\model\article\ArticleCate;
//use app\common\model\article\ArticleCollect;


/**
 * 号源逻辑
 * Class AServiceTicketLogic
 * @package app\api\logic
 */
class AServiceTicketLogic extends BaseLogic
{

    public static function getAvailableServicePersonsList($startDateTime, $endDateTime, $servicePersonId = '')
    {
        $serviceTicket = new AServiceTicketRelated();
        return $serviceTicket->queryAvailableServicePersons($startDateTime, $endDateTime, $servicePersonId);

    }

    public static function getOnePersonAvailableServiceTime($startDateTime, $endDateTime, $servicePersonId = '')
    {
        $serviceTicket = new AServiceTicketRelated();
        return $serviceTicket->queryOnePersonAvailableServiceTime($startDateTime, $endDateTime, $servicePersonId);
    }

}
