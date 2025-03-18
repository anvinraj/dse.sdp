# Copyright 2024 Robert Bosch GmbH
#
# SPDX-License-Identifier: Apache-2.0

default: build

.PHONY: build
build:
	mkdir -p out/bin
	mkdir -p bin/graph/yaml
	npm install && npm install -g vsce --force && npm install -g http-server
	vsce package --out ./out/bin

.PHONY: install
install: build
	code --install-extension ./out/bin/fsil-1.0.0.vsix

.PHONY: clean
clean:
	rm -rf out
	rm -rf package-lock.json
	rm -rf node_modules

.PHONY: cleanall
cleanall: clean
