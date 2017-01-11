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

namespace app\index\controller;

use app\index\model\AuthMenu;
use app\index\model\AuthRule;


/**
 * Class Auth 菜单控制器
 * @package app\index\controller
 */
class Menu extends Base {

    use \traits\controller\Jump;

    /**
     *菜单列表
     */
    public function index(){

        // 用户组模型
        $authMenu = AuthMenu::getInstance();
        $where = [];
        $lists = $authMenu::where($where)
            ->field(
                ['menu_id','parent_id','menu_app','menu_model','menu_action','menu_param','menu_type','menu_status','menu_name','menu_icon','menu_sort','create_time','update_time']
            )
            ->order(['menu_sort' => 'ASC','menu_id' => 'DESC'])
            ->select();

        foreach ($lists as $key => $value){

        }

    }


    /**
     * 添加菜单
     */
    public function add(){

//        if ($this->request->isPost()){
        if (1){
            $data = $this->request->post();
            $data = [
                'menu_app' => 'index',
                'menu_model' => 'auth',
                'menu_action' => 'lmx789',
                'menu_name' => '哈哈',
                'menu_type' => 1,
            ];
            if (empty($data)){
                $this->result([],40000,'数据不能为空');
            }

            $result = $this->validate($data,'AuthMenu');
            if (false === $result){
                //数据验证失败
                $this->result([],40001,$result);
            }

            // 菜单模型
            $authMenu = AuthMenu::getInstance();
            $result = $authMenu->save($data);

            if (empty($result)){
                $this->result([],0,'菜单添加失败');
            }

            if (!empty($data['menu_type']) && $data['menu_type'] == 1){
                // 菜单需要验证
                $rule_name = $data['menu_app'].'/'.$data["menu_model"].'/'.$data['menu_action'];
                $rule_where = [];
                $rule_where['rule_name'] = $rule_name;
                $authRule = AuthRule::get($rule_where);
                if (empty($authRule)){
                    //如果没有规则就添加
                    $ruleDate = [
                        'rule_name'     =>      $rule_name,
                        'rule_title'    =>      !empty($data['menu_name']) ? $data['menu_name'] : '',
                    ];
                    $rule_res = AuthRule::getInstance()->save($ruleDate);

                    if (false === $rule_res){
                        $this->result([],0,'规则添加失败');
                    }

                }
            }
            $this->result($data,1,'菜单添加成功');

        }else{

            //添加页面

        }

    }


    /**
     * 编辑菜单
     */
    public function edit(){

        $menu_id = $this->request->param('menu_id/d');
        $where['menu_id'] = $menu_id;
        // 菜单模型
        $authMenu = AuthMenu::where($where)
            ->field(
                ['menu_id','parent_id','menu_app','menu_model','menu_action','menu_param','menu_type','menu_status','menu_name','menu_icon','menu_sort','create_time','update_time']
            )
            ->find();

//        if ($this->request->isPost()){
        if (1){
            $data = $this->request->post();
            $data = [
                'menu_id' => '22',
                'menu_app' => 'index',
                'menu_model' => 'auth',
                'menu_action' => 'lmx',
                'menu_name' => '哈哈',
                'menu_type' => 1,
            ];
            if (empty($data)){
                $this->result([],40000,'数据不能为空');
            }
            if (empty($authMenu)){
                $this->result([],50002,'没有菜单信息');
            }

            $result = $this->validate($data,'AuthMenu');
            if (false === $result){
                //数据验证失败
                $this->result([],40001,$result);
            }

            $result = $authMenu->isUpdate(true)->save($data);

            if (false === $result){
                $this->result([],-1,'数据更新失败');
            }

            if (!empty($data['menu_type']) && $data['menu_type'] == 1){
                $rule_name = $data['menu_app'].'/'.$data["menu_model"].'/'.$data['menu_action'];

                $rule_where = [];
                $rule_where['rule_name'] = $authMenu->menu_app.'/'.$authMenu->menu_model.'/'.$authMenu->menu_action;
                $authRule = AuthRule::get($rule_where);
                $ruleDate = [
                    'rule_name'     =>      $rule_name,
                    'rule_title'    =>      !empty($data['menu_name']) ? $data['menu_name'] : '',
                ];
                $result = $this->validate($ruleDate,'AuthRule');
                if (false === $result){
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


                if (false === $rule_res){
                    $this->result([],-1,'数据更新失败');
                }
            }

            $this->result($data,1,'菜单添加成功');


        }else{

            //编辑页面
            if (empty($authMenu)){
                $this->error('没有菜单信息');
            }

            $this->view->fetch('edit',[
                'authMenu' => $authMenu,
            ]);


        }
    }


}
