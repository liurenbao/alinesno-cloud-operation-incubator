# bak hosts
ansible all  -i ~/.ansible/hosts -m ping

# echo helloworld
ansible all -i ~/.ansible/hosts -a "/bin/echo 'ansible hello world!'"
