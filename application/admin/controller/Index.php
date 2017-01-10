<?php

namespace app\admin\controller;


use think\View;


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



        $view = new View();

        $data['title'] = '首页';

        return $view->fetch('index',[
            'title'     =>      '首页'
        ]);
    }
}
