SiPaMa: Simple Package Manager

elke source dir heeft een package.mk, met daarin 2 targets: install en deinstall. Daarnaast staat erin een versienummer en naam.

Bij het installeren wordt deze package.mk opgeslagen in een dir:

/var/tmp/sipama/$naam-$versie.mk

Ook wordt daar eerst een PREFIX=.... regel toegevoegd.

Bij het deinstalleren wordt deze makefile gebruikt om te deinstalleren.

