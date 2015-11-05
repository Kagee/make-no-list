#! /bin/bash
for FILE in data-ok/*.json.7z; 
do 
	7z e -so -bd $FILE 2>/dev/null | tr '/' '\n' | ../dotno | sort | uniq > data-uniq/$(basename $FILE ".7z"); 
done;

cat data-uniq/*.json | sort | uniq > wayback.domains
