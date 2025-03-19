# Copyright 2024 Robert Bosch GmbH
#
# SPDX-License-Identifier: Apache-2.0

default: build

.PHONY: build
build:
	mkdir -p out/bin
	mkdir -p bin/graph/yaml
	npm install
	vsce package --out ./out/bin/dse.vsix

.PHONY: install
install: build
	unzip ./out/bin/dse.vsix -d /home/codespace/.vscode-remote/extensions/dse.dse-1.0.0
	code --reload-window

.PHONY: clean
clean:
	rm -rf out
	rm -rf package-lock.json
	rm -rf node_modules

.PHONY: cleanall
cleanall: clean
