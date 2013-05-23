# The following line is essential because we have AC_CONFIG_MACRO_DIR([m4]) in configure.ac
# See http://www.gnu.org/software/autoconf/manual/autoconf.html#index-AC_005fCONFIG_005fMACRO_005fDIR-62
ACLOCAL_AMFLAGS 	      = -I m4
LDFLAGS                 = -L$(ROOTLIBDIR) $(ROOTGLIBS) $(ROOTAUXLIBS)
LIBS  		            = $(ROOTGLIBS)

lib_LTLIBRARIES = libsimplerootlibrary.la

libsimplerootlibrary_la_SOURCES = src/DerivedRootClass.cpp src/SimpleRootClass.cpp 
nodist_libsimplerootlibrary_la_SOURCES = src/DerivedRootClassDict.cpp src/SimpleRootClassDict.cpp

libsimplerootlibrary_la_LDFLAGS = -shared -release 1.0 -version-info 0:0:0

dist_noinst_HEADERS     = include/LinkDef.h
dist_include_HEADERS    = include/DerivedRootClass.h include/SimpleRootClass.h 
nodist_noinst_HEADERS 	= src/DerivedRootClassDict.h src/SimpleRootClassDict.h

BUILT_SOURCES	= src/DerivedRootClassDict.cpp src/SimpleRootClassDict.cpp
CLEANFILES  	= src/DerivedRootClassDict.cpp src/SimpleRootClassDict.cpp src/DerivedRootClassDict.h src/SimpleRootClassDict.h

CPPFLAGS	      = -DPKGDATADIR='$(pkgdatadir)' -Wall -Iinclude $(ROOTCFLAGS)
CINTINCLUDES	= $(DEFS) -Iinclude

# generate dictionaries
src/%Dict.cpp : include/%.h include/LinkDef.h
	$(ROOTCINT) -v -f $@ -c -p $(CINTINCLUDES) $^
