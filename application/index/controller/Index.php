<?php
namespace app\index\controller;



use app\index\model\AuthMenu;
use lmxdawn\auth\Auth;
use think\Db;

class Index
{
    public function index()
    {

        $auth = Auth::instance();

        $data = [
            'menu_id' => '51',
            'menu_app' => 'index',
            'menu_model' => 'auth',
            'menu_action' => 'lmx789',
            'menu_name' => '哈哈',
            'menu_type' => 1,
        ];
//
//        $model = new AuthMenu();
//        $model::where(['rule_name' => $data['rule_name']])->count();
//        $result = $model->validate(true)->save($data);
//        if (false === $result){
//            dump($model->getError());
//        }
//        exit;

        $auth->saveMenu($data,true);




    }
}
