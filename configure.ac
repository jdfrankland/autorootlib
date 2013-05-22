#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.61)
AC_INIT([libsimplerootlibrary], [1.0], [https://bugs.launchpad.net/libsimplerootlibrary])
AC_CONFIG_SRCDIR([include/LinkDef.h])
AC_CONFIG_HEADER([config.h])

# Checks for programs.
AC_PROG_CXX
#ROOT minimum version 5.30
ROOT_PATH( [5.34/00] ,
	,
	[ AC_MSG_ERROR( [You must install ROOT (version 5.34/00 or later) before installing fazia-gui] ) ]
)

CREATE_ROOT_LIB_MAKEFILE([simplerootlibrary],[src],[include],[include/LinkDef.h])

# The following line will not work without ACLOCAL_AMFLAGS 	= -I m4 in top-level Makefile.am
# See http://www.gnu.org/software/autoconf/manual/autoconf.html#index-AC_005fCONFIG_005fMACRO_005fDIR-62
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
AM_SILENT_RULES([yes])

AM_PROG_LIBTOOL

# Checks for libraries.

# Checks for header files.
AC_HEADER_STDC

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST

# Checks for library functions.

   AC_CONFIG_FILES(
           [Makefile]
   )
AC_OUTPUT
