#! /bin/bash
for INDEX in $(ls ../storage/cdx-index-client/|grep -P 'CC-MAIN'); 
	do echo $HIL; ./get-unsorted-folder.sh $HIL; 
done
