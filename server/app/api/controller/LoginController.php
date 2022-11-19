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

namespace app\api\controller;

use app\api\validate\{LoginAccountValidate, RegisterValidate, WechatLoginValidate};
use app\api\logic\LoginLogic;

/**
 * 登录注册
 * Class LoginController
 * @package app\api\controller
 */
class LoginController extends BaseApiController
{

    public array $notNeedLogin = ['register', 'account', 'logout', 'codeUrl', 'oaLogin',  'mnpLogin'];


    /**
     * @notes 注册账号
     * @return \think\response\Json
     * @author 段誉
     * @date 2022/9/7 15:38
     */
    public function register()
    {
        $params = (new RegisterValidate())->post()->goCheck('register');
        $result = LoginLogic::register($params);
        if (true === $result) {
            return $this->success('注册成功', [], 1, 1);
        }
        return $this->fail(LoginLogic::getError());
    }


    /**
     * @notes 账号密码/手机号密码/手机号验证码登录
     * @return \think\response\Json
     * @author 段誉
     * @date 2022/9/16 10:42
     */
    public function account()
    {
        $params = (new LoginAccountValidate())->post()->goCheck();
        $result = LoginLogic::login($params);
        if (false === $result) {
            return $this->fail(LoginLogic::getError());
        }
        return $this->data($result);
    }


    /**
     * @notes 退出登录
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 段誉
     * @date 2022/9/16 10:42
     */
    public function logout()
    {
        LoginLogic::logout($this->userInfo);
        return $this->success();
    }


    /**
     * @notes 获取微信请求code的链接
     * @return \think\response\Json
     * @author 段誉
     * @date 2022/9/15 18:27
     */
    public function codeUrl()
    {
        $url = $this->request->get('url');
        $result = ['url' => LoginLogic::codeUrl($url)];
        return $this->success('获取成功', $result);
    }


    /**
     * @notes 公众号登录
     * @return \think\response\Json
     * @throws \GuzzleHttp\Exception\GuzzleException
     * @author 段誉
     * @date 2022/9/20 19:48
     */
    public function oaLogin()
    {
        $params = (new WechatLoginValidate())->post()->goCheck('oa');
        $res = LoginLogic::oaLogin($params);
        if (false === $res) {
            return $this->fail(LoginLogic::getError());
        }
        return $this->success('', $res);
    }


    /**
     * @notes 小程序-登录接口
     * @return \think\response\Json
     * @author 段誉
     * @date 2022/9/20 19:48
     */
    public function mnpLogin()
    {
        $params = (new WechatLoginValidate())->post()->goCheck('mnpLogin');
        $res = LoginLogic::mnpLogin($params);
        if (false === $res) {
            return $this->fail(LoginLogic::getError());
        }
        return $this->success('', $res);
    }


    /**
     * @notes 小程序绑定微信
     * @return \think\response\Json
     * @author 段誉
     * @date 2022/9/20 19:48
     */
    public function mnpAuthBind()
    {
        $params = (new WechatLoginValidate())->post()->goCheck("wechatAuth");
        $params['user_id'] = $this->userId;
        $result = LoginLogic::mnpAuthLogin($params);
        if ($result === false) {
            return $this->fail(LoginLogic::getError());
        }
        return $this->success('绑定成功', [], 1, 1);
    }



    /**
     * @notes 公众号绑定微信
     * @return \think\response\Json
     * @throws \GuzzleHttp\Exception\GuzzleException
     * @author 段誉
     * @date 2022/9/20 19:48
     */
    public function oaAuthBind()
    {
        $params = (new WechatLoginValidate())->post()->goCheck("wechatAuth");
        $params['user_id'] = $this->userId;
        $result = LoginLogic::oaAuthLogin($params);
        if ($result === false) {
            return $this->fail(LoginLogic::getError());
        }
        return $this->success('绑定成功', [], 1, 1);
    }






}