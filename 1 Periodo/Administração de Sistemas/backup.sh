origemUm=~/Documentos	
origemDois=~/Imagens	
destinoUm=./BackupDocumentos	
destinoDois=./BackupImagens
logfile=$destino/logsync.txt	

echo "***********************************************************************"
echo "Bem-vindo ao script de backup automático"
echo "As pastas automaticamente sincronizadas serão: Imagens e Documentos"
echo "***********************************************************************"

for DEV in /sys/block/sd*
do
	if readlink $DEV/device | grep -q usb
	then
		DEV=`basename $DEV`
		echo "$DEV is a USB device, info:"
		udevinfo --query=all --name $DEV
		if [ -d /sys/block/${DEV}/${DEV}1 ]
		then
			echo "Has partitions " /sys/block/$DEV/$DEV[0-9]*
		else
			echo "Has no partitions"
		fi
		echo
	fi
done

# rsync -avzh -progress --delete --exclude='.DS_Store' --delete-excluded --log-file=$logfile $origemUm/ $destinoUm/