#!/bin/bash
# This script describes where to download the official released binaries needed
# It's suggested to download using 'tools/easzup -D', everything needed will be ready in '/etc/ansible'

# version
DOWNLOAD_DIR=/opt/soft
TOMCAT_VER=8.5.51
JENKINS_VER=8.5.51
NEXUS_VER=8.5.51
NGINX_VER=8.5.51
JDK_VER=8.5.51
ELK_VER=8.5.51
REDIS_VER=8.5.51
KAFKA_VER=8.5.51
MINIO_VER=8.5.51
DUBBO_ADMIN_VER=8.5.51
ZBOX_VER=8.5.51
SEATE_VER=8.5.51
YAPI_VER=8.5.51
SHODOC_VER=8.5.51
KONG_VER=8.5.51
HAPROXY_VER=8.5.51

# wget download soft

echo -e "\n----download apache tomcat ${TOMCAT_VER} binary at:"
wget http://static.cloud.linesno.com/soft/apache-tomcat-${TOMCAT_VER}.tar.gz -P /${DOWNLOAD_DIR}

