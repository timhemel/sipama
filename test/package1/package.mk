include base.mk

SIPAMA_NAME=package1
SIPAMA_VERSION=0.1

do-install:
	echo mkdir -p ${PREFIX}/bin
	echo cp abc ${PREFIX}/bin
	echo $$HOME
	echo ${MAKE}
	echo ${MAKEFLAGS}

do-deinstall:
	echo rm ${PREFIX}/bin/abc
	echo rmdir ${PREFIX}/bin

