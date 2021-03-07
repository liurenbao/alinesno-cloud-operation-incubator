#! /bin/bash


remotedir="$1:/root/backupgitlab"

#run backup
gitlab-rake gitlab:backup:create SKIP=repositories

bufile=`ls /var/opt/gitlab/backups`
bdir="/var/opt/gitlab/backups/"
bufile="${bdir}${bufile}"
logfile="/root/backup/gitlab/gitlabbackup.log"
bdyundir="/backup/"

#give log
dt=`date +"%Y-%m-%d"`
lm="$dt------------------------$bufile"

touch ${logfile}
echo ${lm} >> ${logfile}

#backup
#backup log
bypy upload ${logfile} ${bdyundir}backup.log
scp  ${logfile} ${remotedir}

#backup gitlab
bypy upload ${bufile} ${bdyundir}
scp ${bufile} ${remotedir}

#cat ${bufile} | split -b 250m - ${bdir}gitlabbackup.tar.
rm -f ${bufile}
rm -f ${logfile}

#分片备份
#wait
#for file in `ls ${bdir}`
#do
#{
#	bypy upload ${bdir}${file} ${bdyundir}
#	scp ${bdir}${file} ${remotedir}
#} &
#done
