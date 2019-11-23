#!/bin/bash

#Desenvolvedores: 
#Jackson Longo
#José Adilson de Paula Cardoso
#Nícolas Teixeira Guerra Garcia
#Wenderson Patrick
#Vitor Savian

#É utilizado o comando 2>/dev/null após a chamada do Zenity para ignorar warnings indesejaveis durante a execucao da aplicacao

#Abrindo um novo question com sim/não com o Zenity
zenity --question --title="Gerador de backup" --text="Você gostaria de executar o script agora?" --ok-label="Sim" --cancel-label="Não" --width=300 --height=190 2>/dev/null

#Nesse if eu verifico se a resposta foi sim, para iniciar a execução do script de fato
if [ $? = 0 ] ; then

    #Gerando um número aleatório
    random=$$

    #Criando a variável backupScript e a concatenando com o número gerado aleatoriamente
    backupScript="backupScript_"
    backupScript+=""$random".bash"

    #Criando a variável agendarBackup e a concatenando com o número gerado aleatoriamente
    agendarBackup="agendarBackup_"
    agendarBackup+=""$random".bash"

    #Escolha das pastas que o usuário gostaria de efetuar backup
    zenity --info --title="Gerador de backup" --text="Escolha a(s) pasta(s) origem(ns) para backup" --width=300 --height=190 2>/dev/null
    pastas=$(zenity --file-selection --directory --multiple 2>/dev/null)

    #Escolha de qual destino o usuário gostaria de salvar o backup
    zenity --info --title="Gerador de backup" --text="Escolha a pasta destino do backup" --width=300 --height=190 2>/dev/null
    destino=$(zenity --file-selection --directory 2>/dev/null)

    #Validacao para ver se o usuário selecionou alguma pasta de origem e destino para o backup
    if [ -z $pastas ];
    then
        zenity --error --title="Gerador de backup" --text="É preciso escolher no mínimo uma pasta origem para o backup" --width=300 --height=190 2>/dev/null
        exit
    elif [ -z $destino ]
    then
        zenity --error --title="Gerador de backup" --text="É preciso escolher no mínimo uma pasta destino para o backup" --width=300 --height=190 2>/dev/null
        exit
    fi

    # !----------- Sobre o Zenity progress, cada echo com número é uma porcentagem diferente
    # !----------- Sobre o Zenity progress, cada echo com # representa uma nova mensagem da barra de progresso
    # !----------- Sleep representa quantos segundos o script ficará ali antes de prosseguir
    (
    #Verificando se no local que o script está sendo executado já existe um .bash com o mesmo nome de agendarBackup, caso sim eu o deleto (para evitar escrever algo dentro de outro).
    echo "10"
    echo "# Detectando outros scripts de backup já gerados" ; sleep 1
    if [ -f $agendarBackup ] ; then
        rm "${agendarBackup}"
    fi

    #Iniciando de fato a geração do script
    echo "35"
    echo "# Gerando script de backup..." ; sleep 5

    #Criando o arquivo backupScript.bash e logo após lhe dou permissão geral sobre o sistema
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

        #Colocando o RSYNC dentro do backupScript.bash
        echo "rsync --protect-args -avzh -progress --delete --exclude='.DS_Store' --delete-excluded --log-file=backup_$random.log '$element/' '${destinoApoio}_Backup'" >> ./"${backupScript}"
    done
    #Fim do for

    echo "60"
    echo "# Salvando o agendamento em um script separado..."; sleep 3
    #Criando o arquivo agendarBackup.bash (esse que será executado pelo usuário de fato) e logo após concedendo permissão geral sobre o sistema
    touch ./"${agendarBackup}"
    chmod +x ./"${agendarBackup}"
    #Listando tudo que tiver dentro do crontab, passando para um arquivo temporário cronbackup
    echo "crontab -l > cronbackup" >> ./"${agendarBackup}"
    #Colocando a execucação do backupScript dentro do cronbackup, a cada uma hora
    echo 'echo "0 * * * * ${HOME}/Backup/'${backupScript}'" >> cronbackup' >> ./"${agendarBackup}"
    #Registrando o cronbackup dentro do crontab
    echo "crontab cronbackup" >> ./"${agendarBackup}"
    #Removendo o arquivo temporário cronbackup
    echo "rm cronbackup" >> ./"${agendarBackup}"
    echo 'zenity --info --title="Gerador de backup" --text="Agendamento efetuado com sucesso! Os arquivos serão sincronizados a cada uma hora." --width=300 --height=190 2>/dev/null' >> ./"${agendarBackup}"

    echo "75"
    echo "# Movendo o script para um local seguro..."
    #Criando um diretório (caso não houver) chamado Backup em ~/, removendo (caso existir), outro backupScript.bash e finalmente movendo backupScript.bash para o diretórioo
    mkdir -p ${HOME}/Backup
    #Verificando se no local que irei mover o script já existe um com o mesmo nome, caso sim é efetuado o delete desse arquivo
    if [ -f ${HOME}/Backup/"${backupScript}" ] ; then
        rm "${backupScript}"
    fi
    mv ./"${backupScript}" ${HOME}/Backup

    echo "95"
    echo "# Executando o script pela primeira vez..." ; sleep 1
    #Executando o script por uma primeira vez antes de move-lo, efetuando na hora que é gerado a primeira sincronização e backup das pastas selecionadas pelo usuário
    ${HOME}/Backup/"${backupScript}"
    mv ./backup_${random}.log ${HOME}/Backup

    echo "# O script foi gerado com sucesso." ; sleep 0
    echo "100"
    ) |
    zenity --progress --no-cancel --title="Gerador de backup" --text="Iniciando..." --ok-label="Ok" --percentage=0 --width=300 --height=190 2>/dev/null
    #Validacao para ver se deu algum tipo de problema durante o zenity progress
    if [ $? = -1 ] ; then
        zenity --error --text="Erro! Por favor execute o script novamente." --width=300 --height=190 2>/dev/null
    fi

    #Abrindo um novo question com sim/não com o Zenity para efetuar o agendamento automaticamente
    zenity --question --title="Gerador de backup" --text="Você gostaria de efetuar o agendamento agora?" --ok-label="Sim" --cancel-label="Não" --width=300 --height=190 2>/dev/null

    #Nesse if eu verifico se a resposta foi sim, para efetuar o agendamento no cron
    if [ $? = 0 ] ; then
        ./"${agendarBackup}"
    fi
fi