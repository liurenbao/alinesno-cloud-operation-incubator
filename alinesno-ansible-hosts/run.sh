# bak hosts

if [ ! -f "/etc/ansible/hosts.bak"  ];then
    echo '备份原hosts文件数据成功.'
fi

cp /etc/ansible/hosts.bak -f /etc/ansible/hosts

echo '添加hosts主机内容.'
cat hosts >> /etc/ansible/hosts

echo '所有主机内容如下'
cat /etc/ansible/hosts
