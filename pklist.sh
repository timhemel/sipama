#!/bin/sh

# pklist.sh [pattern]

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

printf "%-24s %s\n" "Package" "Installed in"
echo ========================================================
find "$SIPAMA_DBDIR" -type f | while read f
do
	pkg=`basename $f`
	name=`$MAKE -I "$SIPAMA_SRCDIR" -f $f name 2>/dev/null`
	version=`$MAKE -I "$SIPAMA_SRCDIR" -f $f version 2>/dev/null`
	prefix=`$MAKE -I "$SIPAMA_SRCDIR" -f $f prefix 2>/dev/null`
	printf "%-24s %s\n" "$name-$version" "$prefix"
done

