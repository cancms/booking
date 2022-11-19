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
use app\common\model\AServicePerson;
use app\common\lists\ListsSearchInterface;


/**
 * AServicePerson列表
 * Class AServicePersonLists
 * @package app\adminapi\lists
 */
class AServicePersonLists extends BaseAdminDataLists implements ListsSearchInterface
{


    /**
     * @notes 设置搜索条件
     * @return \string[][]
     * @author likeadmin
     * @date 2022/10/21 17:26
     */
    public function setSearch(): array
    {
        return [
            // '=' => ['name', 'introduction'],
            '=' => ['id'],
            '%like%' => ['name'],

        ];
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
        return AServicePerson::where($this->searchWhere)
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
        return AServicePerson::where($this->searchWhere)->count();
    }

}
