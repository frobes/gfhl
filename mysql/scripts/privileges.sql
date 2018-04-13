use mysql;
select host, user from user;
-- 授权root用户并修改密码
grant all privileges on  *.* to 'root'@'%' identified by 'gfhl' with grant option;
grant all privileges on  *.* to 'root'@'localhost' identified by 'gfhl' with grant option;
grant all privileges on  *.* to 'root'@'127.0.0.1' identified by 'gfhl' with grant option;
-- 授权gfhl用户并修改密码
grant all privileges on *.* to 'gfhl'@'%' identified by 'gfhl' with grant option;
grant all privileges on *.* to 'gfhl'@'localhost' identified by 'gfhl' with grant option;
grant all privileges on *.* to 'gfhl'@'127.0.0.1' identified by 'gfhl' with grant option;
select host,user from user;
flush privileges;
