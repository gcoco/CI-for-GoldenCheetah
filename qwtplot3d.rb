require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.zip'
  sha1 '17f55d37ac93fd17d7f3f6b90031ceb796bfe6d1'

  #depends_on 'qt' => :build
  
  def patches
    [
      "https://trac.macports.org/export/94241/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
      "https://trac.macports.org/export/94241/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff",
      DATA
    ]
  end
  
  def install
    system "qmake CONFIG+=release"
    system 'make install'
  end
end

__END__
diff --git a/qwtplot3d/src/qwt3d_function.cpp b/qwtplot3d/src/qwt3d_function.cpp
--- a/qwtplot3d/src/qwt3d_function.cpp
+++ b/qwtplot3d/src/qwt3d_function.cpp
@@ -1,3 +1,4 @@
+#include <cstdio>
 #include "qwt3d_surfaceplot.h"
 #include "qwt3d_function.h"
...
