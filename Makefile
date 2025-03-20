# Copyright 2024 Robert Bosch GmbH
#
# SPDX-License-Identifier: Apache-2.0

export DSE_MODELC_VERSION ?= 2.1.14
export DSE_MODELC_URL ?= https://github.com/boschglobal/dse.modelc/releases/download/v$(DSE_MODELC_VERSION)/ModelC-$(DSE_MODELC_VERSION)-linux-amd64.zip


SUBDIRS = dsl ast graph lsp 
LSPSUBDIRS = client server ast_dag 


default: build


downloads:
	mkdir -p build/downloads
	cd build/downloads; test -s ModelC-$(DSE_MODELC_VERSION)-linux-amd64.zip || ( curl -fSLO $(DSE_MODELC_URL) && unzip -q ModelC-$(DSE_MODELC_VERSION)-linux-amd64.zip )


.PHONY: examples
examples: downloads
	mkdir -p out/examples
	test -d out/examples/modelc || ( cp -R build/downloads/ModelC-$(DSE_MODELC_VERSION)-linux-amd64/examples out/examples/modelc )


.PHONY: build
build:
	@for d in $(SUBDIRS); do ($(MAKE) -C $$d build ); done


.PHONY: test
test:
	@for d in $(SUBDIRS); do ($(MAKE) -C $$d test ); done


.PHONY: install
install:
	@for d in $(SUBDIRS); do \
		if [ "$$d" = "lsp" ]; then \
			for sub in $(LSPSUBDIRS); do \
				$(MAKE) -C lsp/$$sub install; \
			done; \
			$(MAKE) -C lsp install; \
		else \
			$(MAKE) -C $$d install; \
		fi \
	done


.PHONY: clean
clean:
	@for d in $(SUBDIRS); do \
		if [ "$$d" = "lsp" ]; then \
			for sub in $(LSPSUBDIRS); do \
				$(MAKE) -C lsp/$$sub clean; \
			done; \
			$(MAKE) -C lsp clean; \
		else \
			$(MAKE) -C $$d clean; \
		fi \
	done
	rm -rf out


.PHONY: cleanall
cleanall: clean
	@for d in $(SUBDIRS); do \
		if [ "$$d" = "lsp" ]; then \
			for sub in $(LSPSUBDIRS); do \
				$(MAKE) -C lsp/$$sub cleanall; \
			done; \
			$(MAKE) -C lsp cleanall; \
		else \
			$(MAKE) -C $$d cleanall; \
		fi \
	done
	rm -rf build
