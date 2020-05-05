PREFIX ?= /usr/local
BINPREFIX ?= $(PREFIX)/bin

BINS = $(wildcard bin/docker-compose-*)
COMMANDS = $(subst bin/, , $(BINS))

CODE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

default: install

check:
	@echo "Check dependencies before installation"
	@./check_dependencies.sh
	@echo

install: check
	@echo "... installing bins to $(DESTDIR)$(BINPREFIX)"
	@mkdir -p $(DESTDIR)$(BINPREFIX)

	@$(foreach COMMAND, $(COMMANDS), \
		echo "... installing $(COMMAND)"; \
		cp -f bin/$(COMMAND) $(DESTDIR)$(BINPREFIX)/$(COMMAND); \
	)

test:
	command -v docker-compose-ip 2>&1 && @echo "docker-compose-ip available"


.PHONY: install
