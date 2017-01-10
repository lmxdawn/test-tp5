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


use app\index\model\AuthGroup;


/**
 * Class Auth 权限控制器
 * @package app\index\controller
 */
class Auth{

    /**
     * 用户组列表
     */
    public function index(){

        // 用户组模型
        $authGroup = AuthGroup::getInstance();
        $where = [];
        $where['group_status'] = 1;
        $lists = $authGroup::where($where)
            ->field(
                ['group_id','group_title','group_status','group_rules','group_sort','create_time','update_time']
            )
            ->order(['group_sort' => 'ASC','group_id' => 'DESC'])
            ->select();

        foreach ($lists as $key => $value){

        }

    }


    /**
     * 添加用户组
     */
    public function authGroupAdd(){

    }


}
