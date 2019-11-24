# nginx-ansible
1. 采用ansible自动编译，安装，配置nginx
2. 动态生成configure.sh脚本
3. 已测试nginx 1.12.2版本
4. 支持增加新模块
5. 支持centos7.x + , OpenSuse, Ubuntu

## 安装 nginx
1. 下载nginx 版本到本地任意目录
2. 更新vars/var_nginx.yml 文件中的{{download_path}}，工程中files下已放有部分文件，可直接指定为此目录， configure命令添加模块，是采取读取config_list 列表信息，如果你需要增加或删减模块，可在此处更新。同时需要额外编译的模块，可以在role中进行增加，而后在install_nginx role的main.yml文件进行引用

```
---
# version
nginx_version: 1.12.2                     # your nginx version
libunwind_version: 1.1                    # mode version
gperftools_version: 2.2.1
mod_strip_version: 0.1
echo_nginx_module_version: 0.58
#set_misc_nginx_module_version: 0.29

# system
sys_user: root
sys_group: root
nginx_user: root


download_path: '/home/pippo/Downloads/nginx'      # local download path
download_dir: /tmp                                # remote download_dir
install_dir: /opt                                 # install dir


# nginx config list, add your new mod into list
config_list:
    - "--prefix={{install_dir}}/nginx-{{nginx_version}}"
    - "--with-stream"
    - "--with-http_realip_module"
    - "--with-google_perftools_module"
    - "--with-pcre"
    - "--with-http_ssl_module"
    - "--with-http_gzip_static_module"
    - "--with-http_stub_status_module"
    - "--add-module={{download_dir}}/temp/mod_strip-{{mod_strip_version}}"

# nginx config path
http_conf_path: "http_conf.d"                # for http
tcp_conf_path: "tcp_conf.d"                  # for tcp

#nginx.config
worker_processes: 8                           # nginx process

# create path
create_path:
    - "{{install_dir}}"
    - "{{download_dir}}/temp"

# firewall port
firewall_ports:
    - "80"
```

3. 更新hosts文件

```
[nginx]
172.16.251.70

```
4. 执行shell

```
ansible-playbook -i hosts nginx.yml

```

## License

GNU General Public License v3.0
