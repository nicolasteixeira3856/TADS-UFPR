crontab -l > cronbackup
echo "0 * * * * ${HOME}/Backup/backupScript_7647.sh" >> cronbackup
crontab cronbackup
rm cronbackup
echo "Agendamento efetuado com sucesso, as pastas selecionadas serão sincronizadas no local de destino a cada uma hora."
