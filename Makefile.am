# The following line is essential because we have AC_CONFIG_MACRO_DIR([m4]) in configure.ac
# See http://www.gnu.org/software/autoconf/manual/autoconf.html#index-AC_005fCONFIG_005fMACRO_005fDIR-62
ACLOCAL_AMFLAGS 	= -I m4

AUTOMAKE_OPTIONS	= foreign

AM_LDFLAGS		         = -release $(PACKAGE_VERSION)

lib_LTLIBRARIES = libsimplerootlibrary.la
libsimplerootlibrary_la_SOURCES = src/SimpleRootClass.cpp $(DICTIONARIES)
    
dist_include_HEADERS = include/SimpleRootClass.h
DICTIONARIES = $(dist_include_HEADERS:%.h=%Dict.cpp)
DICT_OBJ = $(DICTIONARIES:%.cpp=%.o) 
DICT_HEAD =  $(DICTIONARIES:%.cpp=%.h) 

include root_libs.mk
