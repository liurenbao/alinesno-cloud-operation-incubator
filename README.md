#### 自动化操作进度文档

> 脚本规划便于自动化操作，同时后续补充和添加

| 脚本说明                 | 任务说明                                     | 负责人 | 状态 | 测试 | 备注                    |
|--------------------------|----------------------------------------------|--------|------|------|-------------------------|
| 01.prepare.yml           | 初始软件,时间同步，hostname等                | Switch | 集成 | 内测 |                         |
| 02.jdk.yml               | 操作jdk                                      | Switch | 集成 |      |                         |
| 03.mysql.yml             | 操作mysql                                    | Switch | 集成 |      |                         |
| 04.gitlab.yml            | 操作gitlab                                   | Switch | 集成 |      |                         |
| 06.nginx.yml             | 操作nginx                                    | Switch | 集成 |      |                         |
| 07.nexus.yml             | 操作nexus2                                   | Switch | 集成 |      |                         |
| 08.jenkins.yml           | 操作jenkins                                  | Switch | 集成 |      |                         |
| 09.zentao.yml            | 操作禅道                                     | Switch |      |      |                         |
| 10.dubbo-admin.yml       | 操作dubbo-admin                              | Switch |      |      |                         |
| 11.zipkin.yml            | 操作链路跟踪                                 | Switch | 集成 |      |                         |
| 12.spring-boot-admin.yml | 操作spring-boot-admin                        | Switch |      |      |                         |
| 13.minio.yml             | 操作云存储服务                               | Switch | 集成 |      |                         |
| 14.config-center.yml     | 操作配置中心                                 | Switch |      |      |                         |
| 15.seate.yml             | 操作分布式事务中心                           | Switch |      |      |                         |
| 16.harbor.yml            | 操作harbor                                   | Switch | 集成 |      |                         |
| 17.kafka.yml             | 操作kafka(集群和单点)                        | Switch | 集成 |      |                         |
| 18.redis.yml             | 操作redis(集群和单点)                        | Switch | 集成 |      |                         |
| 19.nfs.yml               | 操作nfs                                      | Switch | 集成 |      |                         |
| 20.mongodb.yml           | 操作mongodb                                  | Switch | 集成 |      |                         |
| 21.backup.yml            | 文件备份(数据库/文件等)                      | Switch |      |      |                         |
| 22.monitor.yml           | 服务器监控(内存/硬盘/端口/socket等)          | Switch | 集成 |      |                         |
| 23.docker.yml            | 操作docker(配置好国内服务)                   | Switch | 集成 |      |                         |
| 24.efk.yml               | 操作efk                                      | Switch | 集成 |      |                         |
| 25.zookeeper.yml         | 操作zookeepre(集群和单点)                    | Switch | 集成 |      |                         |
| 26.yapi.yml              | 操作yapi接口测试                             | Switch |      |      |                         |
| 27.kong.yml              | 操作kong(同步安装界面akong)                  | Switch | 集成 |      |                         |
| 29.nodejs.yml            | 操作nodejs(并配置国内链接)                   | Switch | 集成 |      |                         |
| 30.haproxy.yml           | 操作haproxy                                  | Switch | 集成 |      |                         |
| 32.tomcat.yml            | 操作tomcat(端口/启动和关闭脚本/优化)         | Switch | 集成 |      |                         |
| 33.showdoc.yml           | 操作开发文档工具                             | Switch |      |      |                         |
| 33.k8s.yml               | 操作k8s                                      | Switch | 完成 |      | 集成开源工具`kubeaz`    |
| 35.keepalived.yml        | 操作keepalive(主备)                          | Switch | 集成 |      |                         |
| download.sh              | 软件下载脚本(如jdk/mysql)                    | Switch |      |      |                         |
| operation-tool.sh        | 常用的运维工具(生成密钥)                     | Switch |      |      |                         |
| operation.sh             | 常用的脚本                                   | Switch |      |      |                         |
| Ansible可视化操作整合    | 自动化界面开发                               | Switch | 集成 |      | 整合Jenkins运维管理系统 |
| 文档                     | 脚本使用文档,如何使用ansible工具，配置说明等 | Switch | 集成 |      | 重点                    |

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

