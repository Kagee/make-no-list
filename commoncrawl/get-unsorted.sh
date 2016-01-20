#! /bin/bash
for FILENAME in $(find ./storage/cdx-index-client/ -type f -name '*.gz'); 
	do 
		zcat "$FILENAME" | ../default_extract; 
done
