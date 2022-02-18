## 自动化安装脚本
此用于自动安装devops工具环境，同时提供基础的研发平台，集成ansible各种内部脚本，便于修改和集成内部开发环境，
便于一键部署基础环境，主要针对于内部环境少量服务器(1-200台)更为适用

使用说明:<i>待补充链接</i>

### 项目计划

1. [进行中]集成可视化UI，进行在线管理主机和配置
2. [进行中]集成Docker，可随时进行主机管理
2. 集成定时任务方式，可定时处理
3. 集成可视化工作流编排工具，可自动编排任务

### 集成说明

安装 ansible

```shell
yum install ansible
```

配置hosts
>  此处配置hosts示例，同时可以配置hostname，批量更新云服务器

```shell
cat /etc/ansible/hosts

[all]
192.168.101.103  ansible_ssh_user=root ansible_ssh_pass=123456
192.168.101.104  ansible_ssh_user=root ansible_ssh_pass=123456
192.168.101.105  ansible_ssh_user=root ansible_ssh_pass=123456
192.168.101.106  ansible_ssh_user=root ansible_ssh_pass=123456
192.168.101.107  ansible_ssh_user=root ansible_ssh_pass=123456
192.168.101.108  ansible_ssh_user=root ansible_ssh_pass=123456
```

可集成jenkins，可自动化操作
> 此步骤自行配置

运行示例
```shell

# 初始化服务器环境
ansible-playbook 01.prepare.yml --extra-vars "{'chrony_server':'192.168.101.103'}"

# 安装jdk8
ansible-playbook 02.java.yml

# 批量安装ssh免密登陆
 ansible-playbook 33.batchkey.yml

```

### 基础平台自动化部署说明

| 序号 | 类型     | 工具       | 版本 | 单点 | 集群 | 离线 | 在线 | 备注       |
|:----:|----------|------------|------|------|------|------|------|------------|
| 1    | DevOps   | Jdk        |      | 完成 |      |      |      |            |
| 2    | DevOps   | Jenkins    |      | 完成 |      |      |      |            |
| 3    | DevOps   | Nexus      |      | 完成 |      |      |      |            |
| 4    | DevOps   | Maven      |      | 完成 |      |      |      |            |
| 4    | DevOps   | Gitlab     |      | 完成 |      |      |      |            |
| 5    | DevOps   | Sonarqube  |      | 完成 |      |      |      | 需手动启动 |
| 6    | DevOps   | Zookeeper  |      | 完成 |      |      |      |            |
| 7    | DevOps   | MySQL      |      | 完成 |      |      |      |            |
| 8    | DevOps   | Zbox       |      | 完成 |      |      |      |            |
| 10   | 开发工具 | Redis      |      | 完成 |      |      |      |            |
| 11   | 开发工具 | Kafka      |      | 完成 |      |      |      |            |
| 13   | 开发工具 | MinIO      |      | 完成 |      |      |      |            |
| 14   | 开发工具 | Nginx      |      | 完成 |      |      |      |            |
| 15   | 开发工具 | NFS        |      | 完成 |      |      |      |            |
| 16   | 开发工具 | FTP        |      | 完成 |      |      |      |            |
| 9    | 开发工具 | DubboAdmin |      |      |      |      |      |            |
| 17   | 开发工具 | Seate      |      |      |      |      |      |            |
| 12   | 开发工具 | Zipkin     |      |      |      |      |      |            |

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
| 12.sonarqube.yml      | 操作gitlab                                   | Switch | 集成 |      |      |
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

## 开源鸣谢
> 参考了挺多优秀开源项目代码，平台只是一个整合，在此说明，如有缺漏，可提醒添加

- 前端工程参考开源项目[kubeasz]
