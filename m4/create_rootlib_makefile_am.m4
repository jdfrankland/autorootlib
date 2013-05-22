dnl -*- mode: autoconf -*- 
dnl
dnl Autoconf macro to automatically generate Makefile.am to generate
dnl shared libraries including CINT dictionary generation from source files
dnl
dnl Synopsis:
dnl
dnl  CREATE_ROOT_PKGLIB_MAKEFILE([libname],[source dir],[header dir],[link def file])
dnl  CREATE_ROOT_LIB_MAKEFILE([libname],[source dir],[header dir],[link def file])
dnl  CREATE_ROOT_LIBTOOL_MAKEFILE([libname],[source dir],[header dir],[link def file])
dnl
AC_DEFUN([CREATE_ROOT_PKGLIB_MAKEFILE],
[
   AC_MSG_NOTICE([Configuring Makefile.am for PKGLIB library $1])
   AC_SUBST(root_lib_libtype, [pkglib])
   AC_SUBST(root_lib_ldflags, [-release @PACKAGE_VERSION@])
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
AC_DEFUN([CREATE_ROOT_LIB_MAKEFILE],
[
   AC_MSG_NOTICE([Configuring Makefile.am for LIB library $1])
   AC_SUBST(root_lib_libtype, [lib])
   AC_SUBST(root_lib_ldflags, "-release $PACKAGE_VERSION")
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
AC_DEFUN([CREATE_ROOT_LIBTOOL_MAKEFILE],
[
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
