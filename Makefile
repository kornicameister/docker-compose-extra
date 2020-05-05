PREFIX ?= /usr/local
BINPREFIX ?= $(PREFIX)/bin

COMMANDS_BINS = $(wildcard commands/docker-compose-*)
COMMANDS = $(subst bin/, , $(COMMANDS_BINS))
MAIN_COMMAND = $(PWD)/docker-compose

CODE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

default: install

check:
	@echo "Check dependencies before installation"
	command -v docker >/dev/null 2>&1 || { @echo "require docker" ; exit 1 }
	command -v docker >/dev/null 2>&1 || { @echo "require docker" ; exit 1 }
	@echo

install: check
	@mkdir -p $(DESTDIR)$(BINPREFIX)

	cp -f $(MAIN_COMMAND) $(DESTDIR)$(BINPREFIX)/$(MAIN_COMMAND)

	@$(foreach COMMAND, $(COMMANDS), \
		echo "... installing $(COMMAND)"; \
		cp -f $(COMMAND) $(DESTDIR)$(BINPREFIX)/$(COMMAND); \
	)

test:
	command -v docker-compose-ip 2>&1 && @echo "docker-compose-ip available"


.PHONY: install
