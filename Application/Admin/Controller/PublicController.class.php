<?php

namespace Admin\Controller;

use Think\Controller;

class PublicController extends Controller 
{
    public function login()
    {
        if(IS_POST){


            $email = I('post.email');

            $pass = I('post.pass');

            $where['email'] = $email;

            $where['status'] = array('NEQ', 0);

            $data = M('admin')->field('password,email,account')->where($where)->find();
            
            $isLogin = password_verify($pass, $data['password']);

            if ($isLogin) {

                $_SESSION['admin'] = $data;
                $this->success('登录成功', U('Index/index'));
                exit;
            }else{

                $this->error('登录失败');
                exit;
            }

        }else{

            // echo '微信收藏项目后台';
            $this->display('Index/login');
        }

    }
}
