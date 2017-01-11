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
 * Class AuthGroup 权限授权模型验证器
 * @package app\index\validate
 */
class AuthAccess extends Validate
{
    //当前验证的规则
    protected $rule = [

    ];

    //验证提示信息
    protected $message = [

    ];

    //验证场景 scene = ['edit'=>'name1,name2,...']
    protected $scene = [

    ];
}