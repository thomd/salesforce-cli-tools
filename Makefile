SHELL = /bin/bash
BINDIR ?= $(HOME)/bin
SOURCEDIR = $(PWD)
COMPLETIONSDIR = $(HOME)/etc/bash_completion.d

link:
	@while read -r f; do ln -s ${SOURCEDIR}/$${f} ${BINDIR}/$${f}; done < <(find * -type f -maxdepth 0 -name "sf-*")
	@while read -r f; do ln -s ${SOURCEDIR}/$${f} ${COMPLETIONSDIR}/$${f}; done < <(find bash_completion.d -type f -name "sf-*")

prune:
	@echo "prune"
