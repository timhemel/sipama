name:
	@echo ${NAME}

version:
	@echo ${VERSION}

prefix:
	@echo ${PREFIX}


ifndef PREFIX
install:
	@echo Please specify a PREFIX.
else
install: do-install
	@echo PREFIX=$(PREFIX) > $(SIPAMA_DBDIR)/${NAME}
	@cat package.mk >> $(SIPAMA_DBDIR)/${NAME}
endif

deinstall: do-deinstall
	@rm $(SIPAMA_DBDIR)/${NAME}

