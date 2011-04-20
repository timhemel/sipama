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
install: pre-install do-install register post-install
endif

register:
	@echo PREFIX=$(PREFIX) > $(SIPAMA_DBDIR)/${NAME}
	@cat package.mk >> $(SIPAMA_DBDIR)/${NAME}

deinstall: do-deinstall
	@rm $(SIPAMA_DBDIR)/${NAME}

pre-install:
	
post-install:
	
