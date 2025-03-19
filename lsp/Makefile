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
	unzip -q ./out/bin/dse.vsix "extension/*" -d /home/codespace/.vscode-remote/extensions/temp
	mkdir /home/codespace/.vscode-remote/extensions/dse.fsil-1.0.0
	mv /home/codespace/.vscode-remote/extensions/temp/extension/* /home/codespace/.vscode-remote/extensions/dse.fsil-1.0.0/
	rm -rf /home/codespace/.vscode-remote/extensions/temp

.PHONY: clean
clean:
	rm -rf out
	rm -rf package-lock.json
	rm -rf node_modules

.PHONY: cleanall
cleanall: clean
