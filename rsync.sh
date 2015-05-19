lockfile=/var/lock/mylock
tmpfile=${lockfile}.$$
echo $$ > $tmpfile
if ln $tmpfile $lockfile 2>&-; then
    echo locked
else
    echo locked by $(<$lockfile)
    rm $tmpfile
    exit
fi
trap "rm ${tmpfile} ${lockfile}" 0 1 2 3 15

echo "Rsync Started" | mail -s "RSYNC Started " abhatikar@github.com
/usr/bin/rsync -azvh --delete --log-file="/root/logs/my-rsync.log.$(date +%Y%m%d%H%m%S)" rsync://remote-ip/path /local/path/on-client
