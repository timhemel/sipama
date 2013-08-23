CONFIGDIR=$$HOME/.sipama
BINDIR=$$HOME/bin

all:
	@echo Use ${MAKE} install to install the software

check-db-upgrade:
	( [ -d ${CONFIGDIR}/db ] && sh upgradedb.sh ) || true

install: check-db-upgrade
	mkdir -p ${CONFIGDIR}
	cp base.mk ${CONFIGDIR}
	cp local.sh.example ${CONFIGDIR}/local.sh
	echo MAKE=${MAKE} >> ${CONFIGDIR}/local.sh
	mkdir -p ${CONFIGDIR}/db
	mkdir -p ${BINDIR}
	cp pkdeinst.sh ${BINDIR}
	cp pkinst.sh ${BINDIR}
	cp pklist.sh ${BINDIR}

