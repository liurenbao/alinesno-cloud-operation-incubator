## devops自动安装脚本
此用于自动安装devops工具环境，同时提供基础的研发平台

### 基础平台自动化部署说明

| 序号 | 类型     | 工具       | 版本 | 单点 | 集群 | 离线 | 在线 | 备注 |
|:----:|----------|------------|------|------|------|------|------|------|
| 1    | DevOps   | Jdk        |      |      |      |      |      |      |
| 2    | DevOps   | Jenkins    |      |      |      |      |      |      |
| 3    | DevOps   | Nexus      |      |      |      |      |      |      |
| 4    | DevOps   | Maven      |      | 集成 |      |      | 集成 |      |
| 5    | DevOps   | Qubesonar  |      |      |      |      |      |      |
| 6    | DevOps   | Zookeeper  |      |      |      |      |      |      |
| 7    | DevOps   | MySQL      |      |      |      |      |      |      |
| 8    | DevOps   | Harbor     |      |      |      |      |      | .    |
| 9    | 开发工具 | DubboAdmin |      |      |      |      |      |      |
| 10   | 开发工具 | Redis      |      |      |      |      |      |      |
| 11   | 开发工具 | Kafka      |      |      |      |      |      |      |
| 12   | 开发工具 | Zipkin     |      |      |      |      |      |      |
| 13   | 开发工具 | MinIO      |      |      |      |      |      |      |
| 14   | 开发工具 | Nginx      |      |      |      |      |      |      |
| 15   | 开发工具 | NFS        |      |      |      |      |      |      |
| 16   | 开发工具 | FTP        |      |      |      |      |      |      |
| 17   | 开发工具 | Seate      |      |      |      |      |      |      |

### 自动化操作进度文档
> 脚本规划便于自动化操作，同时后续补充和添加

此安装工具提供在线安装和离线安装两个版本(主推离线安装)

| 脚本说明              | 任务说明                                     | 负责人 | 状态 | 测试 | 备注 |
|-----------------------|----------------------------------------------|--------|------|------|------|
| 01.prepare.yml        | 初始软件,时间同步，hostname等                | Switch | 集成 | 内测 |      |
| 02.jdk.yml            | 操作jdk                                      | Switch | 集成 | 内测 |      |
| 03.mysql.yml          | 操作mysql                                    | Switch | 集成 | 内测 |      |
| 04.gitlab.yml         | 操作gitlab                                   | Switch | 集成 |      |      |
| 05.ftp.yml            | 操作ftp                                      | Switch |      |      |      |
| 06.nginx.yml          | 操作nginx                                    | Switch | 集成 | 内测 |      |
| 07.nexus.yml          | 操作nexus2                                   | Switch | 集成 |      |      |
| 08.jenkins.yml        | 操作jenkins                                  | Switch | 集成 |      |      |
| 09.zbox.yml           | 操作禅道                                     | Switch |      |      |      |
| 10.dubbo-admin.yml    | 操作dubbo-admin                              | Switch |      |      |      |
| 11.zipkin.yml         | 操作链路跟踪                                 | Switch | 集成 |      |      |
| 13.minio.yml          | 操作云存储服务                               | Switch | 集成 |      |      |
| 15.seate.yml          | 操作分布式事务中心                           | Switch |      |      |      |
| 16.harbor.yml         | 操作harbor                                   | Switch | 集成 |      |      |
| 17.kafka.yml          | 操作kafka(集群和单点)                        | Switch | 集成 |      |      |
| 18.redis.yml          | 操作redis(集群和单点)                        | Switch | 集成 |      |      |
| 19.nfs.yml            | 操作nfs                                      | Switch | 集成 |      |      |
| 21.backup.yml         | 文件备份(数据库/文件等)                      | Switch |      |      |      |
| 24.elk.yml            | 操作elk                                      | Switch | 集成 |      |      |
| 25.zookeeper.yml      | 操作zookeepre(集群和单点)                    | Switch | 集成 |      |      |
| 29.nodejs.yml         | 操作nodejs(并配置国内链接)                   | Switch | 集成 | 内测 |      |
| 32.tomcat.yml         | 操作tomcat(端口/启动和关闭脚本/优化)         | Switch | 集成 | 内测 |      |
| download.sh           | 软件下载脚本(如jdk/mysql)                    | Switch |      |      |      |
| operation-tool.sh     | 常用的运维工具(生成密钥)                     | Switch |      |      |      |
| operation.sh          | 常用的脚本                                   | Switch |      |      |      |
| Ansible可视化操作整合 | 自动化界面开发                               | Switch | 集成 |      |      |
| 文档                  | 脚本使用文档,如何使用ansible工具，配置说明等 | Switch | 集成 |      | 重点 |

### 目录结构

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

### 其它
- 略
