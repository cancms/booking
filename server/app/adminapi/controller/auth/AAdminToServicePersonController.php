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

namespace app\adminapi\controller\auth;

use app\adminapi\{
    logic\auth\AAdminToServicePersonLogic,
    logic\auth\RoleLogic,
    lists\auth\RoleLists,
    validate\auth\RoleValidate,
    controller\BaseAdminController
};

/**
 * 控制器
 * Class RoleController
 * @package app\adminapi\controller\auth
 */
class AAdminToServicePersonController extends BaseAdminController
{

    // public array $notNeedLogin = ['all'];



    // post api
    // 更新关系， 先删除原有的，再添加新的关系
    public function saveRelationsForAdmin()
    {
        try {
            $params = $this->request->post();
            $result = AAdminToServicePersonLogic::saveRelationsForAdmin($params['adminId'], $params['servicePersonIds']);

            // $cid = $this->request->post('cid', 0);
            // $result = UploadService::image($cid);
            return $this->success('上传成功', $result);
        } catch (Exception $e) {
            return $this->fail($e->getMessage());
        }

    }

}
