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
 * Class AuthGroup 权限规则模型验证器
 * @package app\index\validate
 */
class AuthRule extends Validate
{
    //当前验证的规则
    protected $rule = [
        'rule_name'      =>      'require|max:80',
    ];

    //验证提示信息
    protected $message = [
        'rule_name.require'      => '规则名称不能为空',
        'rule_name.max'         => '规则名称长度不能超过80个字符',
    ];

    //验证场景 scene = ['edit'=>'name1,name2,...']
    protected $scene = [

    ];
}