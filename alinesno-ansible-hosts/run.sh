# bak hosts

if [ ! -f "/etc/ansible/hosts.bak"  ];then
    echo '备份原hosts文件数据成功.'
    cp /etc/ansible/hosts /etc/ansible/hosts.bak
fi

echo '添加hosts主机内容.'
rm /etc/ansible/hosts
cp hosts -f /etc/ansible/hosts

echo '所有主机内容如下'
cat /etc/ansible/hosts
