NAMESPACE=amorimdev
PREFIX=edirectinsure
PACKAGES=auth user project task webapi

DEFAULT_BRANCH=master

INSTALL_COMMAND=rm -Rf node_modules package-lock.json && npm install

TEST_COMMAND=npm test

SERVICES=$(foreach package, $(PACKAGES), ../$(PREFIX)-services/$(package))

$(SERVICES):
	-git clone -b $(DEFAULT_BRANCH) https://github.com/$(NAMESPACE)/$(PREFIX)-$(@F).git $@;

.DEFAULT_GOAL := all

all: $(SERVICES)

install:
	@$(foreach package,$(PACKAGES),cd ../$(PREFIX)-services/$(package)/ && $(INSTALL_COMMAND) && cd -;)

reinstall:
	@$(foreach package,$(PACKAGES),rm -rf ../$(PREFIX)-services/$(package)/node_modules/;)
	@$(foreach package,$(PACKAGES),cd ../$(PREFIX)-services/$(package)/ && $(INSTALL_COMMAND) && cd -;)

test:
	@$(foreach package,$(PACKAGES),cd ../$(PREFIX)-services/$(package)/ && $(TEST_COMMAND) && cd -;)
