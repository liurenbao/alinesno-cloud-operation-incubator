#!/usr/bin/expect
spawn ssh root@172.17.49.194
  expect {
    "yes/no" { send "yes\r"; exp_continue }
    "password:" { send "Xinhu\@1234qwer\r" }
  }
  expect "100%"
  send "mkdir -p /root/backup/gitlab\r"
  expect "eof"
