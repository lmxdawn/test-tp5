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
 * Class AuthGroup 用户组数据表模型
 * @package app\index\model
 */
class AuthGroup extends Model
{

    // 数据完成时
    protected $auto = ['update_time'];
    protected $insert = ['create_time'];
    protected $update = [];

    /**
     * 设置更新时间字段
     */
    protected function setUpdateTimeAttr(){
        return time();
    }

    /**
     * 设置创建时间字段
     */
    protected function setCreateTimeAttr(){
        return time();
    }



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