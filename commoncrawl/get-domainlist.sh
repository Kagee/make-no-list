#! /bin/bash
for INDEX in $(ls ../storage/cdx-index-client/|grep -P 'CC-MAIN'); 
	do 
		# Saves as $1.domains.index
		echo $INDEX; ./get-domains-index.sh $INDEX; 
done
cat *.domains.index commoncrawl.domains | sort | uniq > commoncrawl.domains.tmp
mv commoncrawl.domains.tmp commoncrawl.domains
