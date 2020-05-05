PREFIX ?= /usr/local
BINPREFIX ?= $(PREFIX)/bin

COMMANDS_BINS = $(wildcard commands/docker-compose-*)
COMMANDS = $(subst bin/, , $(COMMANDS_BINS))

CODE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

default: install

check:
	@echo "Check dependencies before installation"
	@./check_dependencies.sh
	@echo

install: check
	@mkdir -p $(DESTDIR)$(BINPREFIX)
	@$(foreach COMMAND, $(COMMANDS), \
		echo "... installing $(COMMAND)"; \
		cp -f $(COMMAND) $(DESTDIR)$(BINPREFIX)/$(COMMAND); \
	)

test:
	command -v docker-compose-ip 2>&1 && @echo "docker-compose-ip available"


.PHONY: install
