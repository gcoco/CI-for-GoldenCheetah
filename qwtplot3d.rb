require 'formula'

class qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'

  def patches
    DATA
  end
  
  def install
    system "qmake CONFIG+=release"
    system 'make install'
  end
end

__END__
# Cherry-pick from:
# http://sourceforge.net/p/qwtplot3d/code/226/tree/trunk/qwtplot3d/src/qwt3d_function.cpp?diff=185 
--- a/trunk/qwtplot3d/include/qwt3d_io_gl2ps.h
+++ b/trunk/qwtplot3d/include/qwt3d_io_gl2ps.h
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
