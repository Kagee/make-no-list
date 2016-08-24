#! /bin/bash
if [ ! -z "$1" ]; then
	INDEX=$1
	if [ ! -f "${INDEX}.domains.index" ]; then
		for FILENAME in $(find ../storage/cdx-index-client/${INDEX}/ -type f -name '*.gz'); 
			do
				echo "Getting domains from $FILENAME"	
				zcat "$FILENAME" | ../default_extract >> "${INDEX}.domains.index" 
		done
	else
		echo "Found ${INDEX}.domains.index, skipping ...";
	fi
else
	echo "No index specified"
fi
