#! /bin/bash
cd ../storage/cdx-index-client
# Index list from http://index.commoncrawl.org/
#for INDEX in CC-MAIN-2014-52 CC-MAIN-2015-06 CC-MAIN-2015-11 CC-MAIN-2015-14 CC-MAIN-2015-18 CC-MAIN-2015-22 CC-MAIN-2015-27 CC-MAIN-2015-32 CC-MAIN-2015-35 CC-MAIN-2015-40 CC-MAIN-2015-48 CC-MAIN-2016-07 CC-MAIN-2016-18 CC-MAIN-2016-22 
for INDEX in CC-MAIN-2016-18 CC-MAIN-2016-22
	do mkdir -p $INDEX; cd $INDEX; ../cdx-index-client.py -p 4 -c $INDEX '*.no' --fl url -z; cd ..;
done;

