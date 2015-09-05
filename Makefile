-include .config.mk

PREFIX ?= /opt/ensure

all: # do nothing as default target

install:
	install -d $(PREFIX)/bin
	install -d $(PREFIX)/lib/ensure
	install -d $(PREFIX)/libexec/ensure
	install ./bin/ensure $(PREFIX)/bin
	install ./lib/ensure/* $(PREFIX)/lib/ensure/
	install ./libexec/ensure/* $(PREFIX)/libexec/ensure/
	$(PREFIX)/bin/ensure bootstrap

uninstall:
	rm -f $(PREFIX)/bin/ensure
	rm -rf $(PREFIX)/lib/ensure
	rm -rf $(PREFIX)/libexec/ensure

clean:
	rm -f .config.mk
