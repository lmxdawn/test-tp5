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
use think\Db;


/**
 * Class Base 测试控制器
 * @package app\index\controller
 */
class Test{


    /**
     * 事务操作的测试 （主要针对模型的事务）
     * url 地址 [http://localhost/test-tp5/public/index.php/index/test/trans]
     */
    public function trans(\app\index\model\Test $test){

        // 模型里面的事务
        //启动事务
        $test->db()->startTrans();

        try{

            $test->name = '123456';
            $result = $test->save();

            dump($result);

            $test->db()->commit();


        }catch (\Exception $e){
            //回滚事务
            $test->db()->rollback();
        }


//        //数据里面的事务
//        // 启动事务
//        Db::startTrans();
//        try{
//            Db::name('test')->insert(['name' => '123456']);
//            // 提交事务
//            Db::commit();
//            //Db::rollback();
//        } catch (\Exception $e) {
//            // 回滚事务
//            Db::rollback();
//        }

    }

}
