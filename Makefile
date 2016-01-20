OUTPUT := all_domains.txt

all: $(OUTPUT)

.PHONY: alexa/top-1m.csv.zip

clean:
	rm -f $(OUTPUT).tmp $(OUTPUT)

$(OUTPUT).tmp: alexa/alexa.domains 2-letter/2.domains
	cat $^ > $(OUTPUT).tmp

$(OUTPUT): $(OUTPUT).tmp
	sort $(OUTPUT).tmp | uniq > $(OUTPUT)

commoncrawl/download.json: 
	# Not phony, as it generated and must 
	# be updated manually
	# I don't think this downloads all matches ....
	wget -O download.json "http://urlsearch.commoncrawl.org/download?q=no."

commoncrawl/commoncrawl.domains: commoncrawl/download.json
	cat $< | ./default_extract > $@

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
