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

namespace app\adminapi\lists;


use app\adminapi\lists\BaseAdminDataLists;
// use app\common\model\AServicePerson;
use app\common\lists\ListsSearchInterface;
use app\common\model\AServiceTicketRelated;
use app\common\model\AViewServiceTicketRelated;


/**
 * AServicePerson列表
 * Class AServicePersonLists
 * @package app\adminapi\lists
 */
class AServiceTicketRelatedLists extends BaseAdminDataLists implements ListsSearchInterface
{

    public function __construct()
    {
        parent::__construct();
        $this->setCustomSearch();
    }

    /**
     * @notes 设置搜索条件
     * @return \string[][]
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public function setSearch(): array
    {
        return [
            '=' => ['service_person_id', 'booking_status'],

            // between 1 and 2, 包括 1 和 2在内, select * from sn_a_service_person where id between 2 and 3
            'between' => 'service_time', // get 传参：  start, end


            // TIME()函数，用于提取时间字段的时间，例如t01的tdate为'2020-05-26 11:11:11'，返回的格式为"HH:ii:ss"
            // select time(tdate) from t01;
            // 返回：11:11:11
            'between_mysql_time' => 'time(service_time)', // get 传参： startTime, endTime

        ];
    }

    private function setCustomSearch ()
    {

    }


    /**
     * @notes 获取列表
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public function lists(): array
    {
        return AServiceTicketRelated::where($this->searchWhere)
            ->field(['id', 'name', 'avatar', 'brief_intro', 'introduction'])
            ->limit($this->limitOffset, $this->limitLength)
            ->order(['id' => 'desc'])
            ->select()
            ->toArray();
    }


    /**
     * @notes 获取数量
     * @return int
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public function count(): int
    {
        return AServiceTicketRelated::where($this->searchWhere)->count();
    }

}
