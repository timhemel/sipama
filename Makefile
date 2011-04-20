CONFIGDIR=$$HOME/.sipama
BINDIR=$$HOME/bin

install:
	mkdir -p ${CONFIGDIR}
	cp base.mk ${CONFIGDIR}
	cp local.sh.example ${CONFIGDIR}/local.sh
	echo MAKE=${MAKE} >> ${CONFIGDIR}/local.sh
	mkdir -p ${CONFIGDIR}/db
	cp pkdeinst.sh ${BINDIR}
	cp pkinst.sh ${BINDIR}
	cp pklist.sh ${BINDIR}

