dnl -*- mode: autoconf -*- 
dnl
dnl Autoconf macro to automatically generate Makefile.am to generate
dnl ROOT-based shared libraries including CINT dictionary generation from source files
dnl
dnl Synopsis:
dnl
dnl  CREATE_ROOT_PKGLIB_MAKEFILE([libname],[version-info],[source dir],[header dir],[link def file])
dnl  CREATE_ROOT_LIB_MAKEFILE([libname],[version-info],[source dir],[header dir],[link def file])
dnl  CREATE_ROOT_LIBTOOL_MAKEFILE([libname],[source dir],[header dir],[link def file])
dnl
dnl Arguments:
dnl    [libname]      = name of library without 'lib' prefix, e.g. to create a shared
dnl                     library called 'libtoto.so', use [libname]=[toto]
dnl    [version-info] = libtool version-info [current:revision:age]
dnl                     (see http://www.gnu.org/software/automake/manual/libtool.html#Versioning)
dnl                     The rules for libtool versioning (N.B.: this has nothing to do with the package version!) are:
dnl
dnl                             1. Start with version information of 0:0:0 for each new libtool library.
dnl                             2. Update the version information only immediately before a public release of your software.
dnl                                     More frequent updates are unnecessary, and only guarantee that the current interface number
dnl                                     gets larger faster.
dnl                             3. If the library source code has changed at all since the last update, then increment revision
dnl                                     (c:r:a becomes c:r+1:a).
dnl                             4. If any interfaces have been added, removed, or changed since the last update,
dnl                                     increment current, and set revision to 0.
dnl                             5. If any interfaces have been added since the last public release, then increment age.
dnl                             6. If any interfaces have been removed or changed since the last public release, then set age to 0. 
dnl
dnl    [source dir]   = path to directory containing the '.cpp' files of classes to be
dnl                     placed in the library. The path starts at the top level directory,
dnl                     therefore if your sources are in $(top_srcdir)/src, use [source dir]=[src]
dnl    [header dir]   = path to directory containing the '.h' files of classes to be
dnl                     placed in the library. The path starts at the top level directory,
dnl                     therefore if your headers are in $(top_srcdir)/include, use [header dir]=[include]
dnl                     Each header file must contain the pragma directive(s) required for
dnl                     dictionary creation, i.e. at least the lines
dnl                        #ifdef __MAKECINT__
dnl                        #pragma link off all classes;
dnl                        #pragma link C++ class NameOfThisClass+;
dnl                        #endif
dnl    [link def file]= path to the (dummy) LinkDef.h used for dictionary creation. This file
dnl                     must contain only the following lines:
dnl                        #ifdef __CINT__
dnl                        #pragma link off all function;
dnl                        #pragma link off all global;
dnl                        #pragma link off all typedef;
dnl                        #endif
dnl                     The path starts at the top level directory, therefore if LinkDef.h is
dnl                     in $(top_srcdir)/include, use [link def file]=[include/LinkDef.h]
dnl
dnl Usage:
dnl
dnl  CREATE_ROOT_PKGLIB_MAKEFILE will build a shared library and install it in
dnl                              $(libdir)/$(PACKAGE_NAME)/
dnl  CREATE_ROOT_LIB_MAKEFILE will build a shared library and install it in
dnl                              $(libdir)/
dnl  CREATE_ROOT_LIBTOOL_MAKEFILE will generate a libtool convenience library (.la file)
dnl                               which can later be combined with others to create an
dnl                               installable shared library file (convenience libraries
dnl                               cannot be installed).
dnl
AC_DEFUN([CREATE_ROOT_PKGLIB_MAKEFILE],
[
  AC_REQUIRE([ROOT_PATH])
   AC_MSG_NOTICE([Configuring Makefile.am for PKGLIB library $1])
   AC_SUBST(root_lib_libtype, [pkglib])
   AC_SUBST(root_lib_ldflags, "-release $PACKAGE_VERSION -version-info $2")
   AC_SUBST(root_lib_srcdir, $3)
   AC_SUBST(root_lib_incdir, $4)
   root_makefile_sources=`ls $3/*.cpp | grep -v Dict | tr '\n' ' '`
   root_makefile_headers=`ls $4/*.h | grep -v LinkDef.h | tr '\n' ' '`
   root_cint_headers=`echo $root_makefile_sources | awk '{ gsub(/.cpp/,"Dict.h"); print }'`
   root_cint_sources=`echo $root_makefile_sources | awk '{ gsub(/.cpp/,"Dict.cpp"); print }'`
   AC_SUBST(root_makefile_libname, lib$1)
   AC_SUBST(root_makefile_sources)
   AC_SUBST(root_makefile_headers)
   AC_SUBST(root_cint_headers)
   AC_SUBST(root_cint_sources)
   AC_SUBST(root_cint_linkdef, $5)
   AC_CONFIG_FILES([Makefile.am])
])
AC_DEFUN([CREATE_ROOT_LIB_MAKEFILE],
[
  AC_REQUIRE([ROOT_PATH])
   AC_MSG_NOTICE([Configuring Makefile.am for LIB library $1])
   AC_SUBST(root_lib_libtype, [lib])
   AC_SUBST(root_lib_ldflags, "-release $PACKAGE_VERSION -version-info $2")
   AC_SUBST(root_lib_srcdir, $3)
   AC_SUBST(root_lib_incdir, $4)
   root_makefile_sources=`ls $3/*.cpp | grep -v Dict | tr '\n' ' '`
   root_makefile_headers=`ls $4/*.h | grep -v LinkDef.h | tr '\n' ' '`
   root_cint_headers=`echo $root_makefile_sources | awk '{ gsub(/.cpp/,"Dict.h"); print }'`
   root_cint_sources=`echo $root_makefile_sources | awk '{ gsub(/.cpp/,"Dict.cpp"); print }'`
   AC_SUBST(root_makefile_libname, lib$1)
   AC_SUBST(root_makefile_sources)
   AC_SUBST(root_makefile_headers)
   AC_SUBST(root_cint_headers)
   AC_SUBST(root_cint_sources)
   AC_SUBST(root_cint_linkdef, $5)
   AC_CONFIG_FILES([Makefile.am])
])
AC_DEFUN([CREATE_ROOT_LIBTOOL_MAKEFILE],
[
  AC_REQUIRE([ROOT_PATH])
   AC_MSG_NOTICE([Configuring Makefile.am for LIBTOOL convenience library $1])
   AC_SUBST(root_lib_libtype, [noinst])
   AC_SUBST(root_lib_ldflags, [])
   AC_SUBST(root_lib_srcdir, $2)
   AC_SUBST(root_lib_incdir, $3)
   root_makefile_sources=`ls $2/*.cpp | grep -v Dict | tr '\n' ' '`
   root_makefile_headers=`ls $3/*.h | grep -v LinkDef.h | tr '\n' ' '`
   root_cint_headers=`echo $root_makefile_sources | awk '{ gsub(/.cpp/,"Dict.h"); print }'`
   root_cint_sources=`echo $root_makefile_sources | awk '{ gsub(/.cpp/,"Dict.cpp"); print }'`
   AC_SUBST(root_makefile_libname, lib$1)
   AC_SUBST(root_makefile_sources)
   AC_SUBST(root_makefile_headers)
   AC_SUBST(root_cint_headers)
   AC_SUBST(root_cint_sources)
   AC_SUBST(root_cint_linkdef, $4)
   AC_CONFIG_FILES([Makefile.am])
])
#
# EOF
#
