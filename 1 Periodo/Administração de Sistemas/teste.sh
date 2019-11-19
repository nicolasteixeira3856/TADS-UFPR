#Exemplo de var folders=$(zenity --file-selection --directory --multiple)
#!/bin/sh
zenity --question --title="Gerador de backup" --text="Você gostaria de executar o script agora?" --ok-label="Sim" --cancel-label="Não" --width=240 --height=140
if [ $? = 0 ] ; then
    zenity --info --title="Gerador de backup" --text="Escolha a(s) pasta(s) para backup" --width=240 --height=140
    pastas=$(zenity --file-selection --directory --multiple)
    (
    echo "10"
    echo "# Indexando as pastas selecionadas..." ; sleep 3
    IFS='|' read -r -a arrayPastas <<< "$pastas"
    for element in "${arrayPastas[@]}"
    do
        echo "Teste"
    done
    
    echo "25"
    echo "# Varrendo o diretório destino..." ; sleep 2

    echo "50"
    echo "# Anexando metadados..." ; sleep 2

    echo "75"
    echo "# Gerando script de backup..." ; sleep 5

    echo "99"
    echo "# Finalizando o script..." ; sleep 1

    echo "# O script foi gerado com sucesso." ; sleep 0
    echo "100"
    ) |
    zenity --progress --no-cancel --title="Gerador de backup" --text="Iniciando..." --ok-label="Ok" --percentage=0 --width=290 --height=100
fi



