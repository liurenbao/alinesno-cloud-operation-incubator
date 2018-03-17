- 安装源
```
ansible gz-mesos -a 'rpm -Uvh http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm'
```

- 安装mesos
```
ansible gz-mesos -a 'yum -y install mesos marathon'
```

- 配置zk
```
ansible gz-mesos -a 'echo "zk://172.20.200.74:2181,172.20.200.75:2181,172.20.200.76:2181/mesos" > /etc/mesos/zk'
```