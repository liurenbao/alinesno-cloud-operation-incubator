# bak hosts
ansible all -m ping

# echo helloworld
ansible all -a "hostname -i && /bin/echo helloworld"
