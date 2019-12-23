Ansible-Zipkin
=========

Zipkin is a distributed tracing system <http://zipkin.io>. This role installing it in Docker, with MySQL backend.

Requirements
------------

Any host with docker, docker-compose and systemd should be work.

Role Variables
--------------

* `zipkin_home` - default `/opt/zipkin`
* `zipkin_user - default `zipkin`
* `zipkin_version - default `1.8.1`
* `zipkin_db_name - default `zipkin`
* `zipkin_db_user - default `zipkin`
* `zipkin_db_password - default `zipkinpwd`
* `zipkin_scribe_port - default `9410`
* `zipkin_api_port - default `9411`
* `zipkin_web_port - default `9412`

Example Playbook
----------------

```
- hosts: zipkin
  name: zipkin
  roles:
    - role: ansible-docker
      docker_compose_version: '1.8'
      docker_api_version: '1.9'
    - role: unitedtraders.zipkin
```

License
-------

BSD

Author Information
------------------

Anton Markelov <doublic@gmail.com> - <https://github.com/strangeman>