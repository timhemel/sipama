sipamarelease:
	@echo 00001

name:
	@echo ${SIPAMA_NAME}

version:
	@echo ${SIPAMA_VERSION}

prefix:
	@echo ${PREFIX}


ifndef PREFIX
install:
	@echo Please specify a PREFIX.
else
install: pre-install do-install register post-install
endif

register:
	@echo PREFIX=$(PREFIX) > $(SIPAMA_DBDIR)/${SIPAMA_NAME}
	@cat package.mk >> $(SIPAMA_DBDIR)/${SIPAMA_NAME}

deinstall: do-deinstall
	@rm $(SIPAMA_DBDIR)/${SIPAMA_NAME}

pre-install: ;

post-install: ;

