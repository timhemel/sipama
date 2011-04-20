SiPaMa: Simple Package Manager
------------------------------

SiPaMa is a simple package manager that can be used for small scripts, configuration files and other things for which a true package manager would be overkill. It is based on the philosophy that the package author tells how to install and deinstall the software, relative to an installation prefix.

Installing SiPaMa
-----------------

Unpack or checkout the source directory. Then install the software using GNU make. This will create a directory $HOME/.sipama and install the software in $HOME/bin.

Using SiPaMa
------------

Installing software: if you have a program that can be installed with SiPaMa, it has a file package.mk. To install the software, go to the directory that contains this file, and type pkinst.sh PREFIX=/path/to/installation/directory. What exactly the PREFIX should be, depends on the program. After the installation, the original package.mk is stored with the installation settings, so that the package can be deinstalled.

You can only install one version of a package (although with a hack, you may be able to work around this limitation, if the author of the package file made this possible).

List the installed packages
---------------------------

To see which packages are installed using SiPaMa, use the command pklist.sh. This will show the package name, version number, and installation directory.

It is not possible to see which files are installed as part of the package.


Deinstall a package
-------------------

To deinstall a package, use the command

pkdeinst.sh packagename

This will deinstall the files that were installed by the project.


How to write a package.mk file
-------------------------------

The package.mk file should have at least the following elements:

include base.mk

NAME=myprogram
VERSION=2.0

do-install:
	# code to install the files

do-deinstall:
	# code to deinstall the files

In addition, you can create the targets pre-install and post-install, to do any operations before or after the actual installation and registration. The variables NAME and VERSION are needed for the registration. If you want to allow a user to install the same program under a different name, you can use:

NAME?=myprogram

so that the user can override the NAME variable during installation:

pkinst.sh PREFIX=/path/to/different/install/dir NAME=myotherprogram

The include directive at the beginning of the file needs to be at the beginning and without it, the installation will not work.



