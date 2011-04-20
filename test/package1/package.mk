include base.mk

NAME=package1
VERSION=0.1

do-install:
	echo mkdir -p ${PREFIX}/bin
	echo cp abc ${PREFIX}/bin
	echo $$HOME
	echo ${MAKE}

do-deinstall:
	echo rm ${PREFIX}/bin/abc
	echo rmdir ${PREFIX}/bin

