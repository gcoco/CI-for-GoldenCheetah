require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'
  sha1 '4463fafb8420a91825e165da7a296aaabd70abea'

#  depends_on 'qt'

#  def patches
#    {
#      :p0 => [
#        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
#        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff"
#      ]
#    }
#  end
  def patches
    DATA 
  end

  def install
    inreplace "qwtplot3d.pro", "$$INSTALLBASE", "#{prefix}"
    system "cat qwtplot3d.pro"
#    system "qmake -makefile -spec unsupported/macx-clang"
#    system "make install"
  end
end


__END__
diff U3 a/qwtplot3d.pro.orig b/qwtplot3d.pro
--- a/qwtplot3d.pro.orig	Tue Nov 26 11:00:56 2013
+++ b/qwtplot3d.pro	Wed Dec 18 12:49:56 2013
@@ -1,27 +1,27 @@
 # pro file for building the makefile for qwtplot3d
 #
 
-TARGET            = qwtplot3d
+TARGET            = qwtplot3d-qt4
 TEMPLATE          = lib
-CONFIG           += qt warn_on opengl thread zlib debug
+CONFIG           += qt warn_on opengl thread zlib release
 MOC_DIR           = tmp
 OBJECTS_DIR       = tmp
 INCLUDEPATH       = include
 DEPENDPATH        = include src
-DESTDIR      			= lib
-#DESTDIR      			= ../../../lib
+DESTDIR      	  = lib
+#DESTDIR      	  = ../../../lib
 QT += opengl
 
 win32:TEMPLATE    = vclib
 win32:CONFIG     += dll exceptions
-win32:dll:DEFINES    += QT_DLL QWT3D_DLL QWT3D_MAKEDLL
+win32:dll:DEFINES        += QT_DLL QWT3D_DLL QWT3D_MAKEDLL
 win32:QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS_STL
 
 # Comment the next line, if you have zlib on your windows system
 win32:CONFIG -= zlib
 
 linux-g++:TMAKE_CXXFLAGS += -fno-exceptions
-unix:VERSION = 0.2.6
+unix:VERSION = 0.2.7
 
 # Input
 SOURCES += src/qwt3d_axis.cpp \
@@ -42,7 +42,7 @@
            src/qwt3d_scale.cpp
 
 SOURCES += src/qwt3d_gridmapping.cpp \
-					 src/qwt3d_parametricsurface.cpp \
+		   src/qwt3d_parametricsurface.cpp \
            src/qwt3d_function.cpp
 
 SOURCES += src/qwt3d_surfaceplot.cpp \
@@ -53,7 +53,7 @@
 HEADERS += include/qwt3d_color.h \
            include/qwt3d_global.h \
            include/qwt3d_types.h \
-	         include/qwt3d_axis.h \
+	       include/qwt3d_axis.h \
            include/qwt3d_coordsys.h \
            include/qwt3d_drawable.h \
            include/qwt3d_helper.h \
@@ -71,7 +71,7 @@
            include/qwt3d_portability.h
 						
 HEADERS += include/qwt3d_mapping.h \
-					 include/qwt3d_gridmapping.h \
+		   include/qwt3d_gridmapping.h \
            include/qwt3d_parametricsurface.h \
            include/qwt3d_function.h
 
@@ -91,5 +91,5 @@
 zlib {
   DEFINES += GL2PS_HAVE_ZLIB
   win32:LIBS += zlib.lib
-	unix:LIBS  += -lz
+  unix:LIBS  += -lz
 }
\ No newline at end of file
