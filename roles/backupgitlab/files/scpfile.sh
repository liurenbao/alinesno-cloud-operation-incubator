#!/usr/bin/expect
spawn scp /root/hello root@47.115.42.99:/root/backup/gitlab/hello
  expect {
    "password:" { send "Xinhu\@1234qwer\r" }
    "yes/no" { send "yes\r" }
  }
  expect "eof"
