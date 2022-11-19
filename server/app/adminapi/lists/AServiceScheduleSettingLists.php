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
use app\common\model\AServiceScheduleSetting;
use app\common\lists\ListsSearchInterface;


/**
 * AServiceScheduleSetting列表
 * Class AServiceScheduleSettingLists
 * @package app\adminapi\lists
 */
class AServiceScheduleSettingLists extends BaseAdminDataLists implements ListsSearchInterface
{


    /**
     * @notes 设置搜索条件
     * @return \string[][]
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public function setSearch(): array
    {
        return [
            '=' => ['label',
                'enabled', 'service_person_id', 'avg_duration', 'booking_fee', 'booking_minutes_delay',
                'start_date', 'end_date',
                'am_service_times', 'am_start_time', 'am_end_time',
                'pm1_service_times', 'pm1_start_time', 'pm1_end_time',
                'pm2_service_times', 'pm2_start_time', 'pm2_end_time'
            ],

        ];
    }


    /**
     * @notes 获取列表
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public function lists(): array
    {
        return AServiceScheduleSetting::where($this->searchWhere)
            ->field(['id', 'label', 'enabled', 'service_person_id', 'avg_duration', 'booking_fee',  'booking_minutes_delay',
                'start_date', 'end_date', 'am_service_times', 'am_start_time', 'am_end_time', 'pm1_service_times', 'pm1_start_time', 'pm1_end_time', 'pm2_service_times', 'pm2_start_time', 'pm2_end_time'])
            ->limit($this->limitOffset, $this->limitLength)
            ->order(['id' => 'desc'])
            ->select()
            ->toArray();
    }


    /**
     * @notes 获取数量
     * @return int
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public function count(): int
    {
        return AServiceScheduleSetting::where($this->searchWhere)->count();
    }

}
