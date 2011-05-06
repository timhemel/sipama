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


get_sipama_version () {
	RELEASE=`$MAKE --no-print-directory -s -I "$SIPAMA_SRCDIR" -f "$SIPAMA_SRCDIR"/base.mk sipamarelease 2>/dev/null`
	RELEASE="v$RELEASE"
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

get_sipama_version

# upgrade from nothing to release 00001
if [ "$RELEASE" '<' 'v00001' ]
then
	echo "Upgrading to v00001..."
	find "$SIPAMA_DBDIR" -type f -a \! -name '*.v?????' | while read f
	do
		sed -i.v00000 's/\(SIPAMA_\)\{0,1\}\(NAME\|VERSION\)/SIPAMA_\2/g' "$f"
	done
fi

