#!/usr/bin/expect
spawn scp $1 root@47.115.42.99:/root/backup/gitlab/
  expect {
    "password:" { send "Xinhu\@1234qwer\r" }
    "yes/no" { send "yes\r" }
  }
  expect "eof"
