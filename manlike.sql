--用户表
create table man_users(
    id int unsigned not null primary key auto_increment,
    nickname varchar(50) not null ,
    regtime  int unsigned not null comment '关注时间',
    lastlogintime int unsigned not null comment '最近登录时间',
    openid   varchar(300) not null comment '微信openid',
    status   tinyint unsigned not null default 1 comment '0禁用1启动',
    rank   tinyint  unsigned not null default 1  comment '1普通用户2活跃用户3vip其他未定',
    password varchar(255) not null,
    wechat varchar(100) not null  comment '真实的微信账号 根据这个来交友',
    index in_status(status),
    index in_openid(openid),
    index in_nickname(nickname)
)engine=innodb default charset=utf8;

--普通用户详情表
create table man_users_detail(
    id int unsigned not null primary key auto_increment,
    uid int unsigned not null comment '关联用户表id',
    headimg varchar(300) not null comment '微信头像',
    descr varchar(300) not null comment '个人描述',
    city varchar(50) not null comment '城市',
    province varchar(30) not null comment '省份',
    login_ip int unsigned not null comment '登录时的ip',
    qq  varchar(20) not null comment 'qq号，用于交友',
    phone int unsigned not null comment '手机号',
    email varchar(100) unique not null,
    isshow tinyint unsigned not null default 1  comment '1不显示用户信息(qq手机)2显示',
    index in_uid(uid),
    index in_headimg(headimg)
)engine=innodb default charset=utf8;



--管理员表
create table man_admin(
    id int unsigned not null primary key auto_increment,
    account varchar(30) not null unique comment '管理员账号',
    password varchar(255) not null,
    email varchar(50) not null unique,
    status tinyint unsigned not null default 1 comment '1启用0禁用2超管',
    logintime int unsigned not null,
    login_addr varchar(200) not null comment '登录地址',
    login_ip int unsigned not null comment '登录ip',

)engine=innodb default charset=utf8;

--管理员测试账号 pass=123
insert into man_admin(account,password,email,status,logintime,login_addr,login_ip) values('cpphp','$2y$10$otkpYb8NzW65tgSAtQTW9ultN.yhXmsPeFe/j0nAnXKdC1IBqna/G','gzphper@163.com',2,unix_timestamp(),'广州',INET_ATON('192.168.22.88'));