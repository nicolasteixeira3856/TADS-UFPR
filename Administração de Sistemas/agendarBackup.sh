crontab -l > cronbackup
echo "0 * * * * ${HOME}/Backup/backupScript.sh" >> cronbackup
crontab cronbackup
rm cronbackup
