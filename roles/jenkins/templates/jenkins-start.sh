#!/usr/bin/env bash
# java -jar jenkins.war --httpPort=80
LOGFILE=jenkins.log
nohup /usr/local/soft/jdk1.8.0_91/bin/java -Dhudson.util.ProcessTree.disable=true -jar /root/jenkins/jenkins.war --httpPort=8088 > $LOGFILE 2>&1
