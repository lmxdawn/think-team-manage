<?php

namespace app\admin\controller;


/**
 * Class Login 账户模块
 * @package app\admin\controller
 */
class Accout extends Base
{

    /**
     * 登录
     */
    public function login(){


        return $this->view->fetch('login',[
            'title'     =>      '登录'
        ]);
    }
}
