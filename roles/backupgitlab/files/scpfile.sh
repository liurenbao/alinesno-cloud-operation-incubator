  #!/usr/bin/expect
spawn scp -r /var/opt/gitlab/backups/ root@172.17.49.194:/root/backup/gitlab/
  expect {
    "password:" { send "Xinhu\@1234qwer\r" }
    "yes/no" { send "yes\r" }
  }
  set timeout 3600
  #wait 3600 
  expect "eof"
