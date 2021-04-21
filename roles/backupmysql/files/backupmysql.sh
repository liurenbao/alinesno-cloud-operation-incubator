#!/bin/bash
source /etc/profile
source ~/.bash_profile

#local backup path
local_path='/root/backupyun/mysql/db_all.sql'

#backup to local
rm -f "$local_path"
mysqldump -uroot -p$1 --all-databases > $local_path

bdyundir="/mysql_backup/"
/usr/local/bin/bypy delete ${bdyundir}
/usr/local/bin/bypy mkdir ${bdyundir}

#backup to yunpan
/usr/local/bin/bypy upload ${local_path} ${bdyundir}
