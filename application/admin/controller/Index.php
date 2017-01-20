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
 * Class Index 后台模块首页
 * @package app\admin\controller
 */
class Index extends Base
{

    /**
     * 首页
     */
    public function index(){


        return $this->view->fetch('index',[
            'title'     =>      '首页'
        ]);
    }
}
