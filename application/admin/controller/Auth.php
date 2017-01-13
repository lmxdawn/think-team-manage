<?php
// +----------------------------------------------------------------------
// | ThinkPHP 5 [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 .
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Byron Sampson <lmxdawn@gmail.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Config;
use think\Db;
use think\Session;


/**
 * Class Auth Auth权限
 * @package app\index\controller
 */
class Auth{


    //默认配置
    protected $_config = array(
        'auth_on' => 1, // 权限开关
        'auth_type' => 1, // 认证方式，1为实时认证；2为登录认证。
        'auth_rule' => 'auth_rule', // 权限规则表
        'auth_access' => 'auth_access', // 权限授权表
        'role' => 'role', // 角色表
        'role_user' => 'role_user', // 用户角色对应表
        'users' => 'users', // 用户信息表
    );

    /**
     * 权限规则数据
     * @var array
     */
    protected $ruleData = [];

    /**
     * 获取权限规则数据
     * @return array
     */
    public function getRuleData() {
        return $this->ruleData;
    }

    /**
     * 用户拥有的角色数据
     * @var array 规则数组
     */
    protected $roleUser = [];

    /**
     * 获取用户拥有角色数据
     * @param $uid 用户id
     * @return array 拥有的角色数组
     */
    public function getRoleUser($uid) {



        return $this->roleUser;
    }

    /**
     * 用户信息
     * @var array
     */
    protected $userInfo = [];

    /**
     * 获取用户信息
     * @return array
     */
    public function getUserInfo($uid) {

        $userinfo = [];

        if (empty($this->userInfo)){

            $userinfo[$uid] = Session::get($this->getSessionKey($uid));

            if (empty($userinfo[$uid])){
                $user = Db::name($this->config['users']);
                // 获取用户表主键
                $_pk = is_string($user->getPk()) ? $user->getPk() : 'id';
                if (!isset($userinfo[$uid])) {
                    $userinfo[$uid] = $user->where($_pk, $uid)->find();
                }
                Session::set($this->getSessionKey($uid),$userinfo[$uid]);
            }


            $this->userInfo = $userinfo[$uid];
        }

        return $this->userInfo;
    }

    private function getSessionKey($uid){
        return md5('_auth_user_info'.$uid);
    }


    /**
     * @var object 对象实例
     */
    protected static $instance;

    /**
     * 单列
     * @param array $options 参数
     * @return object|static 对象
     */
    public static function getInstance($options = []) {
        if (is_null(self::$instance)) {
            self::$instance = new static($options);
        }
        return self::$instance;
    }


    /**
     * 类架构函数 （私有构造函数，防止外界实例化对象）
     * @param array $options 参数
     * Auth constructor.
     */
    private function __construct($options = [])
    {
        //可设置配置项 auth, 此配置项为数组。
        if ($auth = Config::get('auth')) {
            $this->config = array_merge($this->config, $auth);
        }

        // 将传递过来的参数替换
        if (!empty($options) && is_array($options)){
            $this->config = array_merge($this->config, $options);
        }
    }

    /**
     * 私有克隆函数，防止外办克隆对象
     */
    private function __clone() {}

    /**
     * 检查权限
     * @param array  $userInfo 用户基本信息
     * @param array  $name 需要验证的规则列表,支持逗号分隔的权限规则或索引数组
     * @param string $relation 如果为 'or' 表示满足任一条规则即通过验证;如果为 'and'则表示需满足所有规则才能通过验证
     * @return bool 通过验证返回true;失败返回false
     */
    public function check($userInfo = [], $name = [], $relation = 'or'){

        if (empty($userInfo) || empty($name) || empty($this->ruleData)){
            return false;
        }

        return true;
    }

}
