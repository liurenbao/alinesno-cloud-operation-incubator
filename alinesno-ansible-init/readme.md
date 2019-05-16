保存后执行如下命令检测：

```bash
ansible-playbook --syntax-check useradd.yml -e "hosts=qsh_test user=test1 passwd=-11Fe1z.bZ5o."
```

然后运行playbook,使用 -e选项传入参数

```bash
ansible-playbook useradd.yml -e "hosts=qsh_test user=test1 passwd=-11Fe1z.bZ5o."
```
