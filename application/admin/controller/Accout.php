<?php
// +----------------------------------------------------------------------
// | ThinkPHP 5 [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 .
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 黎明晓 <lmxdawn@gmail.com>
// +----------------------------------------------------------------------

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
