<?php

namespace app\admin\controller;


/**
 * Class Login 登录模块
 * @package app\admin\controller
 */
class Login extends Base
{

    /**
     * 首页
     */
    public function index(){


        return $this->view->fetch('index',[
            'title'     =>      '登录'
        ]);
    }
}
