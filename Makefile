SHELL = /bin/bash
BINDIR ?= $(HOME)/bin
SOURCEDIR = $(PWD)

link:
	@while read -r f; do ln -s ${SOURCEDIR}/$${f} ${BINDIR}/$${f}; done < <(find . -type f -name "sf-*")
