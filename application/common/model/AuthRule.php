<?php
/**
 * Created by PhpStorm.
 * User: lk
 * Date: 17/1/8
 * Time: 11:33
 */

namespace app\common\model;

use think\Model;


/**
 * Class User 规则表模型
 * @package app\common\model
 */
class AuthRule extends Model
{

    //自定义初始化
    protected function initialize(){
        //需要调用`Model`的`initialize`方法
        parent::initialize();
        //TODO:自定义的初始化

    }
    /**
     * @var object 对象实例
     */
    protected static $instance;

    /**
     * 初始化
     * @param array $data 数据
     * @return AuthGroup|object
     */
    public static function instance($data = [])
    {
        if (is_null(self::$instance)) {
            self::$instance = new self($data);
        }
        return self::$instance;
    }

}