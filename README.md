### ansible一次性安装devops环境

```shell
(ansible_venv) [root@localhost ansible_home]# tree ansible_playbooks/
ansible_playbooks/
└── roles  必须叫roles
    ├── dbsrvs -------------role1名称
    │   ├── defaults  ---------必须存在的目录，存放默认的变量，模板文件中的变量就是引用自这里。defaults中的变量优先级最低，通常我们可以临时指定变量来进行覆盖
    │   │   └── main.yml
    │   ├── files -------------ansible中unarchive、copy等模块会自动来这里找文件，从而我们不必写绝对路径，只需写文件名
    │   │   ├── mysql.tar.gz
    │   │   └── nginx.tar.gz
    │   ├── handlers -----------存放tasks中的notify指定的内容
    │   │   └── main.yml
    │   ├── meta
    │   ├── tasks --------------存放playbook的目录，其中main.yml是主入口文件，在main.yml中导入其他yml文件，要采用import_tasks关键字，include要弃用了
    │   │   ├── install.yml
    │   │   └── main.yml -------主入口文件
    │   ├── templates ----------存放模板文件。template模块会将模板文件中的变量替换为实际值，然后覆盖到客户机指定路径上
    │   │   └── nginx.conf.j2
    │   └── vars
    └── websrvs -------------role2名称
        ├── defaults
        │   └── main.yml
        ├── files
        │   ├── mysql.tar.gz
        │   └── nginx.tar.gz
        ├── handlers
        │   └── main.yml
        ├── meta
        ├── tasks
        │   ├── install.yml
        │   └── main.yml
        ├── templates
        │   └── nginx.conf.j2
        └── vars
```

#### 自动化操作

> 脚本规划便于自动化操作，同时后续补充和添加

| 脚本说明                 | 任务说明                                     | 负责人 | 状态 | 备注             |
|--------------------------|----------------------------------------------|--------|------|------------------|
| 01.prepare-env.yml       | 初始化ansible hosts                          | Oc204  |    完成   |                  |
| 01.prepare.yml           | 初始软件,时间同步，hostname等                | Oc204  |    完成   |                  |
| 02.jdk.yml               | 操作jdk                                      | Oc204  |      |                  |
| 03.mysql.yml             | 操作mysql                                    | Oc204  |   完成    |                  |
| 04.gitlab.yml            | 操作gitlab                                   | Oc204  |      |                  |
| 05.svnadmin.yml          | 操作svnadmin                                 | Oc204  |      |                  |
| 06.nginx.yml             | 操作nginx                                    | Oc204  |  完成    |                  |
| 07.nexus.yml             | 操作nexus2                                   | Oc204  |      |                  |
| 07.nexus3.yml            | 操作nexus3                                   | Oc204  |      |                  |
| 08.jenkins.yml           | 操作jenkins                                  | Oc204  |      |                  |
| 09.chandao.yml           | 操作禅道                                     | Oc204  |      |                  |
| 10.dubbo-admin.yml       | 操作dubbo-admin                              | Oc204  |      |                  |
| 11.zipkin.yml            | 操作链路跟踪                                 | Oc204  |      |                  |
| 12.spring-boot-admin.yml | 操作spring-boot-admin                        | Oc204  |      |                  |
| 13.minio.yml             | 操作云存储服务                               | Oc204  |      |                  |
| 14.config-center.yml     | 操作配置中心                                 | Oc204  |      |                  |
| 15.seate.yml             | 操作分布式事务中心                           | Oc204  |      |                  |
| 16.harbor.yml            | 操作harbor                                   | Oc204  |      |                  |
| 17.kafka.yml             | 操作kafka(集群和单点)                        | Oc204  |      |                  |
| 18.redis.yml             | 操作redis(集群和单点)                        | Oc204  |      |                  |
| 19.nfs.yml               | 操作nfs                                      | Oc204  |      |                  |
| 20.mongodb.yml           | 操作mongodb                                  | Oc204  |      |                  |
| 21.backup.yml            | 文件备份(数据库/文件等)                      | Oc204  |      |                  |
| 22.monitor.yml           | 服务器监控(内存/硬盘/端口/socket等)          | Oc204  |      |                  |
| 23.docker.yml            | 操作docker(配置好国内服务)                   | Oc204  |      |                  |
| 24.elk.yml               | 操作elk                                      | Oc204  |      |                  |
| 25.zookeeper.yml         | 操作zookeepre(集群和单点)                    | Oc204  |      |                  |
| 26.yapi.yml              | 操作yapi接口测试                             | Oc204  |      |                  |
| 27.kong.yml              | 操作kong(同步安装界面akong)                  | Oc204  |      |                  |
| 28.zabbix.yml            | 操作zabbix和agent                            | Oc204  |      |                  |
| 29.nodejs.yml            | 操作nodejs(并配置国内链接)                   | Oc204  |      |                  |
| 30.haproxy.yml           | 操作haproxy                                  | Oc204  |      |                  |
| 31.jumpserver.yml        | 操作jumpserver(堡垒机)                       | Oc204  |      |                  |
| 32.tomcat.yml            | 操作tomcat(端口/启动和关闭脚本/优化)         | Oc204  |      |                  |
| 33.showdoc.yml           | 操作开发文档工具                             | Oc204  |      |                  |
| 33.k8s.yml               | 操作k8s                                      | Oc204  |      | 集成开源工具     |
| 34.portainer.yml         | 操作portainer                                | Oc204  |      |                  |
| 35.keepalive.yml         | 操作keepalive(主备)                          | Oc204  |      |                  |
| download.sh              | 软件下载脚本(如jdk/mysql)                    | Oc204  |      |                  |
| operation-tool.sh        | 常用的运维工具(生成密钥)                     | Oc204  |      |                  |
| operation.sh             | 常用的脚本                                   | Oc204  |      |                  |
| Ansible可视化操作整合    | 自动化界面开发                               | Switch |      | 整合运维管理系统 |
| 文档                     | 脚本使用文档,如何使用ansible工具，配置说明等 | Switch |      | 重点             |
