origemUm=~/Documents	
origemDois=~/Pictures	
destinoUm=./BackupDocumentos	
destinoDois=./BackupImagens
logfileUm=$destinoUm/logsync.txt
logfileDois=$destinoDois/logsync.txt	

echo "***********************************************************************"
echo "Bem-vindo ao script de backup automático"
echo "Esse script só precisa ser executado uma vez, após isso as pastas Imagens e Documentos efetuarão backup automaticamente a cada uma hora"
echo "***********************************************************************"

sleep 5s

rsync -avzh -progress --delete --exclude='.DS_Store' --delete-excluded --log-file=$logfileUm $origemUm/ $destinoUm/
rsync -avzh -progress --delete --exclude='.DS_Store' --delete-excluded --log-file=$logfileDois $origemDois/ $destinoDois/

crontab -l > cronbackup
echo "0 * * * * /home/nicolas/Documents/TADS-UFPR/1 Periodo/Administração de Sistemas/backup.sh" >> cronbackup
crontab cronbackup
rm cronbackup

echo "Script executado com sucesso, os seus arquivos serão salvos em um local seguro a cada uma hora"