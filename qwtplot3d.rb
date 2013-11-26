require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.zip'
  sha1 '17f55d37ac93fd17d7f3f6b90031ceb796bfe6d1'

  #depends_on 'qt' => :build
  
  def patches
    DATA
  end
  
  def install
    system "qmake CONFIG+=release"
    system 'make install'
  end
end

__END__
--- a/qwtplot3d/src/qwt3d_function.cpp	2007-08-23 12:20:56.000000000 +0200
+++ b/qwtplot3d/src/qwt3d_function.cpp	2009-11-14 14:04:57.000000000 +0100
@@ -1,3 +1,4 @@
+#include <cstdio>
 #include "qwt3d_surfaceplot.h"
 #include "qwt3d_function.h"
