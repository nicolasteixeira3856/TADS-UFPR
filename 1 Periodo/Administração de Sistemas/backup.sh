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
    rm ./agendarBackup.sh

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
    touch ./agendarBackup.sh
    chmod +777 ./agendarBackup.sh
    echo "crontab -l > cronbackup" >> ./agendarBackup.sh
    echo 'echo "0 * * * * ${HOME}/Backup/backupScript.sh" >> cronbackup' >> ./agendarBackup.sh
    echo "crontab cronbackup" >> ./agendarBackup.sh
    echo "rm cronbackup" >> ./agendarBackup.sh

    echo "95"
    echo "# Finalizando o script..." ; sleep 1
    mkdir -p ${HOME}/Backup
    rm -f ${HOME}/Backup/backupScript.sh
    mv ./backupScript.sh ${HOME}/Backup

    echo "# O script foi gerado com sucesso." ; sleep 0
    echo "100"
    ) |
    zenity --progress --no-cancel --title="Gerador de backup" --text="Iniciando..." --ok-label="Ok" --percentage=0 --width=290 --height=100
fi