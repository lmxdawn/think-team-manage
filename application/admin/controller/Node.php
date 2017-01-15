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

use app\common\model\Menu;
use app\common\model\AuthRule;


/**
 * Class Auth 节点控制器
 * @package app\index\controller
 */
class Node extends Base {

    /**
     *菜单列表
     */
    public function index(Menu $Menu){

        $where = [];
        $lists = $Menu::where($where)
            ->field(
                ['id','parent_id','app','model','action','param','type','status','name','icon','listorder','create_time','update_time']
            )
            ->order(['listorder' => 'ASC','id' => 'DESC'])
            ->select();

        return $this->view->fetch('index',[
            'title' => '后台菜单',
            'lists' => $lists
        ]);

    }


    /**
     * 添加菜单
     */
    public function add(){

//        if ($this->request->isPost()){
        if (1){
            $data = $this->request->post();
            $data = [
                'app' => 'index',
                'model' => 'auth',
                'action' => 'add',
                'name' => '哈哈123',
                'type' => 1,
            ];
            if (empty($data)){
                $this->result([],40000,'数据不能为空','json');
            }

            $result = $this->validate($data,'Menu');
            if (true !== $result){
                //数据验证失败
                $this->result([],40001,$result,'json');
            }

            // 菜单模型
            $Menu = Menu::getInstance();
            $result = $Menu->save($data);

            if (empty($result)){
                $this->result([],0,'菜单添加失败','json');
            }

            if (!empty($data['type']) && $data['type'] == 1){
                // 菜单需要验证
                $rule_name = $data['app'].'/'.$data["model"].'/'.$data['action'];
                $rule_where = [];
                $rule_where['name'] = $rule_name;
                $authRule = AuthRule::get($rule_where);
                if (empty($authRule)){
                    //如果没有规则就添加
                    $ruleDate = [
                        'name'     =>      $rule_name,
                        'title'    =>      !empty($data['name']) ? $data['name'] : '',
                    ];
                    $rule_res = AuthRule::getInstance()->save($ruleDate);

                    if (true !== $rule_res){
                        $this->result([],0,'规则添加失败','json');
                    }

                }
            }
            $this->result($data,1,'菜单添加成功','json');

        }else{

            //添加页面

        }

    }


    /**
     * 编辑菜单
     */
    public function edit(){

        $id = $this->request->param('id/d');
        $where['id'] = $id;
        // 菜单模型
        $Menu = Menu::where($where)
            ->field(
                ['id','parent_id','app','model','action','param','type','status','name','icon','listorder','create_time','update_time']
            )
            ->find();

//        if ($this->request->isPost()){
        if (1){
            $data = $this->request->post();
            $data = [
                'id' => '22',
                'app' => 'index',
                'model' => 'auth',
                'action' => 'edit1',
                'name' => '嘿嘿',
                'type' => 1,
            ];
            if (empty($data)){
                $this->result([],40000,'数据不能为空','json');
            }
            if (empty($Menu)){
                $this->result([],50002,'没有菜单信息','json');
            }

            $result = $this->validate($data,'Menu');
            if (true !== $result){
                //数据验证失败
                $this->result([],40001,$result);
            }

            $result = $Menu->isUpdate(true)->save($data);

            if (false == $result){
                $this->result([],-1,'菜单添加失败','json');
            }

            if (!empty($data['type']) && $data['type'] == 1){
                $rule_name = $data['app'].'/'.$data["model"].'/'.$data['action'];

                $rule_where = [];
                $rule_where['name'] = $Menu->app.'/'.$Menu->model.'/'.$Menu->action;
                $authRule = AuthRule::get($rule_where);
                $ruleDate = [
                    'name'     =>      $rule_name,
                    'title'    =>      !empty($data['name']) ? $data['name'] : '',
                ];
                $result = $this->validate($ruleDate,'AuthRule');
                if (true !== $result){
                    //数据验证失败
                    $this->result([],40001,$result);
                }

                if ($authRule){
                    // 有则修改
                    $rule_res = $authRule->isUpdate(true)->save($ruleDate);
                }else{
                    //没有则增加
                    $rule_res = AuthRule::getInstance()->save($ruleDate);
                }


                if (false == $rule_res){
                    $this->result([],-1,'菜单添加成功，权限添加失败','json');
                }
            }

            $this->result($data,1,'菜单更新成功','json');


        }else{

            //编辑页面
            if (empty($Menu)){
                $this->error('没有菜单信息');
            }

            $this->view->fetch('edit',[
                'Menu' => $Menu,
            ]);


        }
    }


}
