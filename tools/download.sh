#!/bin/bash
# This script describes where to download the official released binaries needed
# It's suggested to download using 'tools/easzup -D', everything needed will be ready in '/etc/ansible'

# version
DOWNLOAD_DIR=/opt/soft
TOMCAT_VER=8.5.51
JENKINS_VER=2.204.4
NEXUS_VER=2.14.1-01
MAVEN_VER=3.6.0
NGINX_VER=1.14.1
KEEPALIVED_VER=2.0.10
QUBESONAR_VER=7.9
JDK_VER=8u112
ELK_VER=6.3.1
REDIS_VER=5.0.0
KAFKA_VER=2.11-2.0.1
DUBBO_ADMIN_VER=2.5.6
ZOOKEEPER_VER=3.4.6
ZBOX_VER=11.7

# MINIO_VER=1.0
# SEATE_VER=8.5.51
# YAPI_VER=8.5.51
# SHODOC_VER=8.5.51
# KONG_VER=8.5.51
# HAPROXY_VER=8.5.51
# SVNADMIN_VER=8.5.51
# HARBOR_VER=8.5.51

# wget download soft
echo -e "\n----download apache tomcat ${TOMCAT_VER} binary at:"
wget http://static.cloud.linesno.com/soft/apache-tomcat-${TOMCAT_VER}.tar.gz -P /${DOWNLOAD_DIR}

echo -e "\n----download jenkins ${JENKINS_VER} binary at:"
wget http://static.cloud.linesno.com/soft/jenkins-${TOMCAT_VER}.tar.gz -P /${DOWNLOAD_DIR}

echo -e "\n----download nexus ${NEXUS_VER} binary at:"
wget http://static.cloud.linesno.com/soft/nexus-${TOMCAT_VER}.tar.gz -P /${DOWNLOAD_DIR}
