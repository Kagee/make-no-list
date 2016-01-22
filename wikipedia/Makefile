##########################################
#  The data this makefile downloads and  #
# duplicates requires ~ 30-35 GB storage #
##########################################

OUTPUT := wikipedia.domains

all: $(OUTPUT)

.PHONY: force-wget-timestamp-check

$(OUTPUT): enwiki.domains nowiki.domains
	cat $@ $^ | LC_ALL=C sort | uniq > $@.tmp
	# Bevar gamle domener
	mv $@.tmp $@

nowiki.domains: nowiki.domains.notuniq
	# Some shuffeling to keep old domains
	uniq $< > $@.tmp
	# combine and lower both new and old domains
	cat $@ $@.tmp | /home/hildenae/norid/tolower > $@.tmp2
	LC_ALL=C sort $@.tmp2 > $@.tmp # sort both old and new domains
	uniq $@.tmp > $@ # uniq on whole file
	rm $@.tmp $@.tmp2


enwiki.domains: enwiki.domains.notuniq
	# Some shuffeling to keep old domains
	uniq $< > $@.tmp
	# combine and lower both new and old domains
	cat $@ $@.tmp | /home/hildenae/norid/tolower > $@.tmp2
	LC_ALL=C sort $@.tmp2 > $@.tmp # sort both old and new domains
	uniq $@.tmp > $@ # uniq on whole file
	rm $@.tmp $@.tmp2

enwiki.domains.notuniq: enwiki.domains.unsort
	LC_ALL=C sort $< > $@

nowiki.domains.notuniq: nowiki.domains.unsort
	LC_ALL=C sort $< > $@

enwiki.domains.unsort: enwiki.domains.dotno
	cat $< | /home/hildenae/norid/dotkatno > $@

nowiki.domains.dotno: nowiki-latest-externallinks-with-newlines.sql
	grep -F '.no' $< > $@

enwiki.domains.dotno: enwiki-latest-externallinks-with-newlines.sql
	grep -F '.no' $< > $@

nowiki.domains.unsort: nowiki.domains.dotno
	cat $< | /home/hildenae/norid/dotkatno > $@

enwiki-latest-externallinks-with-newlines.sql: enwiki-latest-externallinks.sql
	# add newlines
	sed -e 's/),(/\n/g' $< > $@

nowiki-latest-externallinks-with-newlines.sql: nowiki-latest-externallinks.sql
	sed -e 's/),(/\n/g' $< > $@

enwiki-latest-externallinks.sql: enwiki-latest-externallinks.sql.gz
	7z -y x $<
	# Since the timestamp of the extracted file will be earlier
	# than the compressed file, copy the timestamp so we won't
	# extract the file *every time*
	touch -r enwiki-latest-externallinks.sql.gz enwiki-latest-externallinks.sql

nowiki-latest-externallinks.sql: nowiki-latest-externallinks.sql.gz
	7z -y x $<
	# Since the timestamp of the extracted file will be earlier
	# than the compressed file, copy the timestamp so we won't
	# extract the file *every time*
	touch -r nowiki-latest-externallinks.sql.gz nowiki-latest-externallinks.sql

enwiki-latest-externallinks.sql.gz: force-wget-timestamp-check
	wget --timestamping https://dumps.wikimedia.org/enwiki/latest/enwiki-latest-externallinks.sql.gz;

nowiki-latest-externallinks.sql.gz: force-wget-timestamp-check
	wget --timestamping https://dumps.wikimedia.org/nowiki/latest/nowiki-latest-externallinks.sql.gz;

force-wget-timestamp-check:
