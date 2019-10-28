origem=./Backup	
destino=./BackupRSYNC	
logfile=$origem/logsync.txt	

echo $origem
echo $destino

rsync -avzh -progress --delete --exclude='.DS_Store' --delete-excluded --log-file=$logfile $origem/ $destino/
