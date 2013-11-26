require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'
  sha1 '4463fafb8420a91825e165da7a296aaabd70abea'

  def patches
    DATA
  end
  
  def install
    system "qmake CONFIG+=release"
    system 'make install'
  end
end

__END__
# Cherry-picked from:
# https://trac.macports.org/browser/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff?rev=94241 
--- qwtplot3d/qwtplot3d.pro 2010-11-02 15:48:06.000000000 -0400
+++ qwtplot3d/qwtplot3d.pro 2010-11-02 15:50:49.000000000 -0400
@@ -3,7 +3,7 @@
 TARGET            = qwtplot3d
 TEMPLATE          = lib
-CONFIG           += qt warn_on opengl thread zlib debug
+CONFIG           += qt warn_on opengl thread zlib release @ARCHES@
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
@@ -92,5 +92,11 @@
   DEFINES += GL2PS_HAVE_ZLIB
   win32:LIBS += zlib.lib
         unix:LIBS  += -lz
-}
\ No newline at end of file
+}
+
+target.path    = $$INSTALLBASE/lib
+headers.path   = $$INSTALLBASE/include/qwtplot3d
+doc.path       = $$INSTALLBASE/share/qwt/doc
+headers.files  = $$HEADERS
+
+INSTALLS       = target headers doc
---
# Cherry-pick from:
# http://sourceforge.net/p/qwtplot3d/code/226/tree/trunk/qwtplot3d/src/qwt3d_function.cpp?diff=185 
--- a/qwtplot3d/include/qwt3d_io_gl2ps.h
+++ b/qwtplot3d/include/qwt3d_io_gl2ps.h
@@ -1,3 +1,4 @@
+#pragma once
 #ifndef qwt3d_io_gl2ps_h__2004_05_07_01_16_begin_guarded_code
 #define qwt3d_io_gl2ps_h__2004_05_07_01_16_begin_guarded_code
 
---
# Cherry-pick from
# http://sourceforge.net/p/qwtplot3d/code/254/tree/branches/multiple_curves_0_2_x/qwtplot3d/include/qwt3d_io_gl2ps.h?diff=219
--- a/branches/multiple_curves_0_2_x/qwtplot3d/include/qwt3d_io_gl2ps.h
+++ b/branches/multiple_curves_0_2_x/qwtplot3d/include/qwt3d_io_gl2ps.h
@@ -2,12 +2,7 @@
 #define qwt3d_io_gl2ps_h__2004_05_07_01_16_begin_guarded_code
 
 #include <time.h>
-
-#if QT_VERSION < 0x040000
-#include <qgl.h>
-#else
-#include <QtOpenGL/qgl.h>
-#endif
+#include <QtOpenGL>
 
 #include "qwt3d_types.h"
 #include "qwt3d_io.h"
--- 
# Cherry-pick from:
# http://sourceforge.net/p/qwtplot3d/code/254/tree//branches/multiple_curves_0_2_x/qwtplot3d/include/qwt3d_openglhelper.h?diff=253
--- a/branches/multiple_curves_0_2_x/qwtplot3d/include/qwt3d_openglhelper.h
+++ b/branches/multiple_curves_0_2_x/qwtplot3d/include/qwt3d_openglhelper.h
@@ -2,11 +2,8 @@
 #define __openglhelper_2003_06_06_15_49__
 
 #include "qglobal.h"
-#if QT_VERSION < 0x040000
-#include <qgl.h>
-#else
-#include <QtOpenGL/qgl.h>
-#endif
+#include <QtOpenGL>
+#include <GL/glu.h>
 
 namespace Qwt3D
 {
---
