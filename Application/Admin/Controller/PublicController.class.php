<?php

namespace Admin\Controller;

use Think\Controller;

class PublicController extends Controller 
{
    public function login()
    {
        // echo '微信收藏项目后台';
        $this->display('Index/login');
    }
}
