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
                'menu_id' => '51',
                'menu_app' => 'index',
                'menu_model' => 'auth',
                'menu_action' => 'lmx789',
                'menu_name' => '哈哈',
                'menu_type' => 1,
            ];
            if (empty($data)){
                $this->result([],40000,'数据不能为空');
            }

            // 菜单模型
            $authMenu = AuthMenu::getInstance();
            $result = $authMenu->validate(true)->save($data);

            if (false === $result){
                $this->result([],40001,$result);
            }

            if (!empty($data['menu_type']) && $data['menu_type'] == 1){
                $rule_name = $data['menu_app'].'/'.$data["menu_model"].'/'.$data['menu_action'];
                $authRule = AuthRule::getInstance();
                $rule_where = [];
                $rule_where['rule_name'] = $rule_name;
                $rule_count = $authRule::where($rule_where)->count();
                if (empty($rule_count)){
                    //如果没有规则就添加
                    $ruleDate = [
                        'rule_name'     =>      $rule_name,
                        'rule_title'    =>      !empty($data['menu_name']) ? $data['menu_name'] : '',
                    ];
                    $rule_res = $authRule->validate(true)->save($ruleDate);

                    if (false === $rule_res){
                        $this->result([],40001,$rule_res);
                    }

                }
            }
            $this->result($data,0,'菜单添加成功');

        }else{

            //添加页面

        }

    }


    /**
     * 编辑菜单
     */
    public function edit(){

//        if ($this->request->isPost()){
        if (1){
            //$data = $this->request->post();
            $data = [
                'menu_id' => '22',
                'menu_app' => 'index',
                'menu_model' => 'auth',
                'menu_action' => 'lmx123',
                'menu_name' => '哈哈',
                'menu_type' => 1,
            ];
            if (empty($data)){
                $this->result([],40000,'数据不能为空');
            }

            // 菜单模型
            $authMenu = AuthMenu::getInstance();

            if (empty($data['menu_id'])){
                $this->result([],50002,'没有菜单信息');
            }
            $where['menu_id'] = $data['menu_id'];
            $info = $authMenu::where($where)
                ->field(
                    ['menu_app','menu_model','menu_action']
                )
                ->find();

            if (empty($info)){
                $this->result([],50002,'没有菜单信息');
            }


            $result = $authMenu->validate(true)->isUpdate(true)->save($data);

            if (false === $result){
                $this->result([],40001,$result);
            }

            if (!empty($data['menu_type']) && $data['menu_type'] == 1){
                $rule_name = $data['menu_app'].'/'.$data["menu_model"].'/'.$data['menu_action'];
                $authRule = AuthRule::getInstance();
                $rule_where = [];
                $rule_where['rule_name'] = $info->menu_app.'/'.$info->menu_model.'/'.$info->menu_action;
                $rule_count = $authRule::where($rule_where)->count();


                if (!empty($rule_count)){
                    //如果没有规则就添加
                    $ruleDate = [
                        'rule_name'     =>      $rule_name,
                        'rule_title'    =>      !empty($data['menu_name']) ? $data['menu_name'] : '',
                    ];
                    $rule_res = $authRule->validate(true)->save($ruleDate);
                }else{
                    //如果没有规则就添加
                    $ruleDate = [
                        'rule_title'    =>      !empty($data['menu_name']) ? $data['menu_name'] : '',
                    ];
                    $rule_res = $authRule->validate(true)->isUpdate(true)->save($ruleDate,['rule_name' => $rule_name]);
                }

                if (false === $rule_res){
                    $this->result([],40001,$rule_res);
                }
            }
            $this->result($data,0,'菜单添加成功');

        }else{

            //编辑页面
            // 菜单模型
            $authMenu = AuthMenu::getInstance();
            $menu_id = $this->request->param('menu_id/d');
            if (empty($menu_id)){
                $this->error('没有菜单信息');
            }
            $where['menu_id'] = $menu_id;
            $info = $authMenu::where($where)
                ->field(
                    ['menu_id','parent_id','menu_app','menu_model','menu_action','menu_param','menu_type','menu_status','menu_name','menu_icon','menu_sort','create_time','update_time']
                )
                ->find();
            if (empty($info)){
                $this->error('没有菜单信息');
            }
            $this->view->fetch('edit',[
                'info' => $info,
            ]);


        }
    }


}
