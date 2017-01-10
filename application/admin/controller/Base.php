<?php

namespace app\admin\controller;


use think\Config;
use think\Controller;
use think\Request;


/**
 * Class Base 基础控制器
 * @package app\admin\controller
 */
class Base extends Controller
{

    /**
     * 构架函数
     * Base constructor.
     */
    public function __construct(Request $request = null) {

        parent::__construct($request);

        $debug = Config::get('app_debug');

        if ($debug == true){
            //调试环境
            Config::set('sys_config.lmx_static_url','//localhost/think-team-manage/public/static');
            Config::set('sys_config.lmx_static_debug',true);


        }else{
            //正式环境

        }

    }


}
