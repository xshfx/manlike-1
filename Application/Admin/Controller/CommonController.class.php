<?php

namespace Admin\Controller;

use Think\Controller;

class CommonController extends Controller 
{
    
    public function __construct()
    {
        parent::__construct();

        //未登录跳转到登录页面
        if ( empty($_SESSION['admin']) ) {
            
            $this->error('请登录',U('Public/login'));
            exit;
        }
    }
}
