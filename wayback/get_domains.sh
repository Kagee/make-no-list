#! /bin/bash
for FILE in data-ok/*.json.7z; 
do 
	echo "Getting domains from $FILE";
	7z e -so -bd $FILE 2>/dev/null | ../urldecode | ../default_extract > data-uniq/$(basename $FILE ".7z"); 
done;

cat data-uniq/*.json | sort | uniq > wayback.domains
