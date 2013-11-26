require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.zip'
  sha1 '17f55d37ac93fd17d7f3f6b90031ceb796bfe6d1'

  #depends_on 'qt' => :build
  
  def patches
    { :p0 => [
      #"https://trac.macports.org/export/94241/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
      #"https://trac.macports.org/export/94241/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff",
      DATA
    ]}
  end
  
  def install
    system "qmake CONFIG+=release"
    system 'make install'
  end
end

__END__
--- C:/Users/gareth.coco/Documents/qwtplot3d-0.2.7/qwtplot3d/qwtplot3d.pro.orig	Tue Nov 26 11:00:56 2013
+++ C:/Users/gareth.coco/Documents/qwtplot3d-0.2.7/qwtplot3d/qwtplot3d.pro	Tue Nov 26 11:06:51 2013
@@ -3,7 +3,7 @@
 
 TARGET            = qwtplot3d
 TEMPLATE          = lib
-CONFIG           += qt warn_on opengl thread zlib debug
+CONFIG           += qt warn_on opengl thread zlib release
 MOC_DIR           = tmp
 OBJECTS_DIR       = tmp
 INCLUDEPATH       = include
@@ -21,7 +21,7 @@
 win32:CONFIG -= zlib
 
 linux-g++:TMAKE_CXXFLAGS += -fno-exceptions
-unix:VERSION = 0.2.6
+unix:VERSION = 0.2.7
 
 # Input
 SOURCES += src/qwt3d_axis.cpp \
@@ -92,4 +92,10 @@
   DEFINES += GL2PS_HAVE_ZLIB
   win32:LIBS += zlib.lib
 	unix:LIBS  += -lz
-}
\ No newline at end of file
+}
+target.path    = $$INSTALLBASE/lib
+headers.path   = $$INSTALLBASE/include/qwtplot3d
+doc.path       = $$INSTALLBASE/share/qwtplot3d/doc
+headers.files  = $$HEADERS
+
+INSTALLS       = target headers doc
\ No newline at end of file
--- include/qwt3d_openglhelper.h.orig	2012-05-29 15:07:16.000000000 -0400
+++ include/qwt3d_openglhelper.h	2012-05-29 15:08:16.000000000 -0400
@@ -5,6 +5,7 @@
 #if QT_VERSION < 0x040000
 #include <qgl.h>
 #else
+#include <OpenGL/glu.h>
 #include <QtOpenGL/qgl.h>
 #endif
 
--- src/qwt3d_function.cpp.orig
+++ src/qwt3d_function.cpp
@@ -1,3 +1,4 @@
+#include <cstdio>
 #include "qwt3d_surfaceplot.h"
 #include "qwt3d_function.h"

