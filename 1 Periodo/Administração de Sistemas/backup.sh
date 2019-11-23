#!/bin/sh

#Abrindo um novo question com sim/não com o Zenity
zenity --question --title="Gerador de backup" --text="Você gostaria de executar o script agora?" --ok-label="Sim" --cancel-label="Não" --width=240 --height=140

#Nesse if eu verifico se a resposta foi sim, para iniciar a execução do script de fato
if [ $? = 0 ] ; then

    random=$$

    backupScript="backupScript_"
    backupScript+=""$random".sh"

    agendarBackup="agendarBackup_"
    agendarBackup+=""$random".sh"

    #Escolha das pastas que o usuário gostaria de efetuar backup
    zenity --info --title="Gerador de backup" --text="Escolha a(s) pasta(s) para backup" --width=240 --height=140
    pastas=$(zenity --file-selection --directory --multiple)

    #Escolha de qual destino o usuário gostaria de salvar o backup
    zenity --info --title="Gerador de backup" --text="Escolha a pasta destino do backup" --width=240 --height=140
    destino=$(zenity --file-selection --directory)

    if [ -z $pastas ];
    then
        zenity --error --title="Gerador de backup" --text="É preciso escolher no mínimo uma pasta origem para o backup" --width=240 --height=140
        exit
    elif [ -z $destino ]
    then
        zenity --error --title="Gerador de backup" --text="É preciso escolher no mínimo uma pasta destino para o backup" --width=240 --height=140
        exit
    fi

    # !----------- Sobre o Zenity progress, cada echo com número é uma porcentagem diferente
    # !----------- Sobre o Zenity progress, cada echo com # representa uma nova mensagem da barra de progresso
    # !----------- Sleep representa quantos segundos o script ficará ali antes de prosseguir
    (
    #Verificando se no local que o script está sendo executado já existe um .sh com o nome de agendarBackup, caso sim eu o deleto (para evitar escrever algo dentro de outro).
    echo "10"
    echo "# Detectando outros scripts de backup já gerados" ; sleep 1
    if [ -f $agendarBackup ] ; then
        rm "${agendarBackup}"
    fi

    #Iniciando de fato a geração do script
    echo "35"
    echo "# Gerando script de backup..." ; sleep 5

    #Criando o arquivo backupScript.sh e logo após lhe dou permissão geral sobre o sistema
    touch ./"${backupScript}"
    chmod +x ./"${backupScript}"

    #Separando o array de pastas por |, tornando assim cada pasta (se houver mais de uma), um indice do array
    IFS='|' read -r -a arrayPastas <<< "$pastas"
    #Executando um for de acordo com o tamanho do arrayPastas
    for element in "${arrayPastas[@]}"
    do
        #Separando novamente por /, dessa vez com o intuito de pegar o nome da pasta selecionada
        IFS='/' read -r -a arrayNomePastas <<< "$element"

        #Colocando a variável destino dentro de uma nova varíavel, buscando assim concatenar o nome da pasta que o usuário escolheu com o destino, tornando o script mais dinâmico e menos redundante
        destinoApoio=$destino
        destinoApoio+="/"${arrayNomePastas[-1]}""

        #Colocando o RSYNC dentro do backupScript.sh
        echo "rsync --protect-args -avzh -progress --delete --exclude='.DS_Store' --delete-excluded --log-file=backup_$random.log '$element/' '$destinoApoio'_Backup" >> ./"${backupScript}"
    done
    #Fim do for

    echo "60"
    echo "# Preparando o agendamento..."; sleep 3
    #Criando o arquivo agendarBackup.sh (esse que será executado pelo usuário de fato) e logo após concedendo permissão geral sobre o sistema
    touch ./"${agendarBackup}"
    chmod +x ./"${agendarBackup}"
    #Listando tudo que tiver dentro do crontab, passando para um arquivo temporário cronbackup
    echo "crontab -l > cronbackup" >> ./"${agendarBackup}"
    #Colocando a execucação do backupScript dentro do cronbackup
    echo 'echo "0 * * * * ${HOME}/Backup/'${backupScript}'" >> cronbackup' >> ./"${agendarBackup}"
    #Registrando o cronbackup dentro do crontab
    echo "crontab cronbackup" >> ./"${agendarBackup}"
    #Removendo o arquivo temporário cronbackup
    echo "rm cronbackup" >> ./"${agendarBackup}"
    echo 'echo "Agendamento efetuado com sucesso, as pastas selecionadas serão sincronizadas no local de destino a cada uma hora."' >> ./"${agendarBackup}"

    echo "75"
    echo "# Movendo o script para um local seguro..."
    #Criando um diretório (caso não houver) chamado Backup em ~/, removendo (caso existir), outro backupScript.sh e finalmente movendo backupScript.sh para o diretórioo
    mkdir -p ${HOME}/Backup
    if [ -f ${HOME}/Backup/"${backupScript}" ] ; then
        rm "${backupScript}"
    fi
    mv ./"${backupScript}" ${HOME}/Backup

    echo "95"
    echo "# Executando o script pela primeira vez..." ; sleep 1
    #Executando o script por uma primeira vez antes de move-lo, efetuando na hora que é gerado a primeira sincronização e backup das pastas selecionadas pelo usuário
    ${HOME}/Backup/"${backupScript}"

    echo "# O script foi gerado com sucesso." ; sleep 0
    echo "100"
    ) |
    zenity --progress --no-cancel --title="Gerador de backup" --text="Iniciando..." --ok-label="Ok" --percentage=0 --width=290 --height=100
fi