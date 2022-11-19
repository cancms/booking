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

namespace app\adminapi\validate;


use app\common\validate\BaseValidate;


/**
 * AServiceScheduleSetting验证器
 * Class AServiceScheduleSettingValidate
 * @package app\adminapi\validate
 */
class AServiceScheduleSettingValidate extends BaseValidate
{


    /**
     * @notes 设置搜索条件
     * @return \string[][]
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    protected $rule = [
        'id' => 'require',
    ];


    /**
     * @notes 添加场景
     * @return AServiceScheduleSettingValidate
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public function sceneAdd()
    {
        return $this->remove('id', true);
    }


    /**
     * @notes 删除场景
     * @return AServiceScheduleSettingValidate
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public function sceneDelete()
    {
        return $this->only(['id']);
    }


    /**
     * @notes 详情场景
     * @return AServiceScheduleSettingValidate
     * @author likeadmin
     * @date 2022/10/22 02:00
     */
    public function sceneDetail()
    {
        return $this->only(['id']);
    }

}