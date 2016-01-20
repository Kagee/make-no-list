OUTPUT := all_domains.txt

all: $(OUTPUT)

.PHONY: alexa/top-1m.csv.zip

clean:
	rm -f $(OUTPUT).tmp $(OUTPUT)

$(OUTPUT).tmp: alexa/alexa.domains 2-letter/2.domains commoncrawl/commoncrawl.domains
	cat $^ > $(OUTPUT).tmp

$(OUTPUT): $(OUTPUT).tmp
	sort $(OUTPUT).tmp | uniq > $(OUTPUT)

commoncrawl/commoncrawl.domains: commoncrawl/commoncrawl.domains.notuniq
	uniq $< > $@

commoncrawl/commoncrawl.domains.notuniq: commoncrawl/commoncrawl.domains.unsorted
	sort $< > $@

commoncrawl/commoncrawl.domains.unsorted: storage/cdx-index-client/CC-MAIN-2014-52/domain-no-00.gz storage/cdx-index-client/CC-MAIN-2015-48/domain-no-67.gz
	commoncrawl/get-unsorted.sh > $@

alexa/top-1m.csv.zip:
	cd alexa; \
	wget -N http://s3.amazonaws.com/alexa-static/top-1m.csv.zip;

alexa/top-1m.csv: alexa/top-1m.csv.zip
	7z x -oalexa -aoa $<

alexa/alexa.domains: alexa/top-1m.csv default_extract
	# Some shuffeling to keep old domains
	cp $@ $@.tmp || true
	cat $< | ./default_extract >> $@.tmp
	sort $@.tmp | uniq > $@
