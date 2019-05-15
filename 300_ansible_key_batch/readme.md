### 配置说明

将需要登陆主机得公钥添加到known_hosts

```bash
ssh-keyscan 192.168.77.129 192.168.77.130 >> /root/.ssh/known_hosts
```

还可以使用下列简单办法：
ssh在首次连接出现检查keys 的提示，通过设置
export ANSIBLE_HOST_KEY_CHECKING=False

这样，在执行playbook时，就跳过这些提示。

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
ansible-playbook -i hosts ssh-addkey.yml
```
