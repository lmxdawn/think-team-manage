<?php

namespace app\admin\controller;


/**
 * Class Index 后台模块首页
 * @package app\admin\controller
 */
class Main extends Base
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
