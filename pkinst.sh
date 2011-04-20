#!/bin/sh

testdir () {
	if [ ! -d "$1" ]
	then
		echo Could not find directory $1!
		echo Please make sure that SiPaMa is correctly installed
		exit 1
	fi
}

testfile () {
	if [ ! -f "$1" ]
	then
		echo Could not find file $1!
		echo Please make sure that SiPaMa is correctly installed
		exit 1
	fi
}


SIPAMA_DIR=$HOME/.sipama
testdir "$SIPAMA_DIR"
testfile "$SIPAMA_DIR/local.sh"
. $SIPAMA_DIR/local.sh

if [ x$SIPAMA_SRCDIR = x ]
then
	SIPAMA_SRCDIR="$SIPAMA_DIR"
fi
testdir "$SIPAMA_SRCDIR"
testfile "$SIPAMA_SRCDIR"/base.mk

if [ x$SIPAMA_DBDIR = x ]
then
	SIPAMA_DBDIR="$SIPAMA_DIR/db"
fi
testdir "$SIPAMA_DBDIR"

PKG=`$MAKE -I "$SIPAMA_SRCDIR" -f package.mk name`

# pkinst.sh [ PREFIX=...] [[var=...]]

if [ -f "$SIPAMA_DBDIR"/"$PKG" ]
then
	echo Package $PKG is already installed!
	echo Please deinstall it first.
	exit 1
fi

$MAKE -I "$SIPAMA_SRCDIR" -f package.mk SIPAMA_DBDIR="$SIPAMA_DBDIR" "$@" install

