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

namespace app\index\model;

use think\Model;


/**
 * Class AuthGroupRule 用户角色对应表表模型
 * @package app\index\model
 */
class RoleUser extends Model
{


    /**
     * @var object 对象实例
     */
    protected static $instance;

    /**
     * 初始化
     * @param array $data 数据
     * @return object|static
     */
    public static function getInstance($data = []) {
        if (is_null(self::$instance)) {
            self::$instance = new self($data);
        }
        return self::$instance;
    }






}
