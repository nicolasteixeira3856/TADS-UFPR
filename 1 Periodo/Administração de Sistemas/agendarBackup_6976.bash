crontab -l > cronbackup
echo "0 * * * * ${HOME}/Backup/backupScript_6976.bash" >> cronbackup
crontab cronbackup
rm cronbackup
zenity --info --title="Gerador de backup" --text="Agendamento efetuado com sucesso! Os arquivos serão sincronizados a cada uma hora." --width=300 --height=190 2>/dev/null
