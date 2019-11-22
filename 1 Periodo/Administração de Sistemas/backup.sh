#Exemplo de var folders=$(zenity --file-selection --directory --multiple)
#!/bin/sh

zenity --question --title="Gerador de backup" --text="Você gostaria de executar o script agora?" --ok-label="Sim" --cancel-label="Não" --width=240 --height=140

if [ $? = 0 ] ; then

    zenity --info --title="Gerador de backup" --text="Escolha a(s) pasta(s) para backup" --width=240 --height=140
    pastas=$(zenity --file-selection --directory --multiple)

    zenity --info --title="Gerador de backup" --text="Escolha a pasta destino do backup" --width=240 --height=140
    destino=$(zenity --file-selection --directory)

    (
    echo "25"
    echo "# Detectando outros scripts de backup já gerados" ; sleep 1

    echo "50"
    echo "# Gerando script de backup..." ; sleep 5
    IFS='|' read -r -a arrayPastas <<< "$pastas"
    for element in "${arrayPastas[@]}"
    do
        IFS='/' read -r -a arrayNomePastas <<< "$element"

        touch ./backupScript.sh
        chmod +777 ./backupScript.sh

        destinoApoio=$destino
        destinoApoio+="/"${arrayNomePastas[-1]}""

        echo "rsync -avzh -progress --delete --exclude='.DS_Store' --delete-excluded $element/ $destinoApoio" >> ./backupScript.sh
    done

    echo "70"
    echo "# Preparando o agendamento..."; sleep 3
    echo "crontab -l > cronbackup" >> ./backupScript.sh
    echo 'echo "${PWD}/backupScript.sh" >> cronbackup' >> ./backupScript.sh
    echo "crontab cronbackup" >> ./backupScript.sh
    echo "rm cronbackup" >> ./backupScript.sh

    echo "99"
    echo "# Finalizando o script..." ; sleep 1

    echo "# O script foi gerado com sucesso." ; sleep 0
    echo "100"
    ) |
    zenity --progress --no-cancel --title="Gerador de backup" --text="Iniciando..." --ok-label="Ok" --percentage=0 --width=290 --height=100
fi

# origemUm=~/Documents	
# origemDois=~/Pictures	
# destinoUm=./BackupDocumentos	
# destinoDois=./BackupImagens
# logfileUm=$destinoUm/logsync.txt
# logfileDois=$destinoDois/logsync.txt	

# echo "***********************************************************************"
# echo "Bem-vindo ao script de backup automático"
# echo "Esse script só precisa ser executado uma vez, após isso as pastas Imagens e Documentos efetuarão backup automaticamente a cada uma hora"
# echo "***********************************************************************"

# sleep 5s

# rsync -avzh -progress --delete --exclude='.DS_Store' --delete-excluded --log-file=$logfileUm $origemUm/ $destinoUm/
# rsync -avzh -progress --delete --exclude='.DS_Store' --delete-excluded --log-file=$logfileDois $origemDois/ $destinoDois/

# crontab -l > cronbackup
# echo "0 * * * * /home/nicolas/Documents/TADS-UFPR/1 Periodo/Administração de Sistemas/backup.sh" >> cronbackup
# crontab cronbackup
# rm cronbackup

# echo "Script executado com sucesso, os seus arquivos serão salvos em um local seguro a cada uma hora"