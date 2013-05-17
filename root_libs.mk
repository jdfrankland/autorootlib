CPPFLAGS		        = -DPKGDATADIR='$(pkgdatadir)' -Wall -I$(top_srcdir)/include $(ROOTCFLAGS)
LDFLAGS              	= -L@ROOTLIBDIR@ @ROOTGLIBS@ @ROOTAUXLIBS@
CINTINCLUDES		      = $(DEFS) -I$(top_srcdir)/include
LIBS  			         = $(ROOTGLIBS)
CLEANFILES  		      = $(MYCINT)Cint.cpp $(MYCINT)Cint.h
AM_LDFLAGS		         = -R @ROOTLIBDIR@

dist_noinst_HEADERS 	   = include/LinkDef.h
nodist_noinst_HEADERS 	= $(DICT_HEAD)

BUILT_SOURCES		      = $(DICT_HEAD) $(DICTIONARIES) 

# generate dictionaries
src/%Dict.cpp : include/%.h
	rootcint -f $@ -c $< include/LinkDef.h
	
