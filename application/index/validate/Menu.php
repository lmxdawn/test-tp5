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

namespace app\index\validate;


use think\Validate;


/**
 * Class AuthGroup 菜单模型验证器
 * @package app\index\validate
 */
class Menu extends Validate
{
    //当前验证的规则
    protected $rule = [
        'menu_app'      =>      'require|max:20'
        ,'menu_model'     =>      'require|max:20'
        ,'menu_action'     =>      'require|max:20'
        ,'menu_name'    =>      'require|max:50'
    ];

    //验证提示信息
    protected $message = [
        'menu_app.require'      => '应用名称不能为空'
        ,'menu_app.max'         => '应用名称长度不能超过20个字符'
        ,'menu_model.require'      => '控制器名称不能为空'
        ,'menu_model.max'         => '控制器名称长度不能超过20个字符'
        ,'menu_action.require'      => '操作名称不能为空'
        ,'menu_action.max'         => '操作名称长度不能超过20个字符'
        ,'menu_name.require'      => '菜单名称不能为空'
        ,'menu_name.max'         => '菜单名称长度不能超过50个字符'
    ];

    //验证场景 scene = ['edit'=>'name1,name2,...']
    protected $scene = [

    ];
}