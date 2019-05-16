### 配置说明

生成管理主机得私钥和公钥

```bash
ssh-keygen -t rsa -b 2048 -P '' -f /root/.ssh/id_rsa
```

添加主机信息到主机清单中

```properties
# hosts
[web]
192.168.77.129 ansible_ssh_pass=1234567
192.168.77.130 ansible_ssh_pass=123456
```

ansible_ssh_pass密码如果一样的话，这里就不需要定义了。在运行ansible-playbook时 加上-k参数，就可以输入登陆密码

配置palybook

```yml
# ssh-addkey.yml
---
- hosts: all
  gather_facts: no
  tasks:
  - name: install ssh key
    authorized_key: user=root
                    key="{{ lookup('file', '/root/.ssh/id_rsa.pub') }}"
                    state=present
```

运行playbook

```bash
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i hosts ssh-addkey.yml
```
