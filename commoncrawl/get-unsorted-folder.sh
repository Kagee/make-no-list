#! /bin/bash
if [ ! -z "$1" ]; then
	for FILENAME in $(find ../storage/cdx-index-client/$1/ -type f -name '*.gz'); 
		do
		       echo "Getting domains from $FILENAME"	
			zcat "$FILENAME" | ../default_extract >> "$1.domains.notsorted.notuniq" 
	done
else
	echo "No folder specified"
fi
