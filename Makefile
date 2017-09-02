VERSION 	:= 0.3.0

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
cwd := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

.PHONY: defaults deps deploy ci provision configure help

default: help

deps: 	## Install dependencies
	brew install ansible direnv lastpass-cli pwgen ssh-copy-id

deploy: ## Deploy changelog.com

ci: 	## Deploy ci.changelog.com

provision:## Provision a new Linode instance
	cf delete -f $(APP)

configure:## Modify Changelog.com defaults
	@echo "All defaults are suitable for https://changelog.com, the current production version"
	@echo "You can change the defaults and deploy a copy of https://changelog.com"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
