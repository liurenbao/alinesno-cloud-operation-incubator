#! /bin/bash
source /etc/profile
source ~/.bash_profile
#run backup

rm -f /var/opt/gitlab/backups/*
rm -f /root/backupyun/gitlab/gitlabbackup.log

gitlab-rake gitlab:backup:create

bufile=`ls /var/opt/gitlab/backups | awk 'NR==1{print}'`
bdir="/var/opt/gitlab/backups/"
bufile="${bdir}${bufile}"
logfile="/root/backupyun/gitlab/gitlabbackup.log"
bdyundir="/backup/"

#give log
dt=`date +"%Y-%m-%d"`
lm="$dt------------------------$bufile"

touch ${logfile}
echo ${lm} >> ${logfile}


bypy delete ${bdyundir}
bypy mkdir ${bdyundir}
#backup
bypy upload ${logfile} "${bdyundir}backup.log"
bypy upload ${bufile} ${bdyundir}

#backup to remote
/root/backupyun/gitlab/mkdir.sh
/root/backupyun/gitlab/scpfile.sh
 
#cat ${bufile} | split -b 250m - gitlabbackup.tar.
#sta=$?
#if [ sta = 0 ] 
#then
#               rm -f ${bufile}
#fi
#rm -f ${logfile}
#
#for file in `ls ${bdir}`
#do
#{
#       bypy upload ${bdir}${file} ${bdyundir}
#       scp ${bdir}${file} ${remotedir}
#} &
#done
#
#wait

exit
