require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.zip'
  sha1 '17f55d37ac93fd17d7f3f6b90031ceb796bfe6d1'

  #depends_on 'qt' => :build
  
  def patches
    #{ :p0 => [
      #"https://trac.macports.org/export/94241/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
      #"https://trac.macports.org/export/94241/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff",
      DATA
    #]}
  end
  
  def install
    system "qmake CONFIG+=release"
    system 'make install'
  end
end

__END__
diff --git a/qwtplot3d.pro b/qwtplot3d.pro
index 4060fe8..b0e8aa6 100644
--- a/qwtplot3d.pro.orig
+++ b/qwtplot3d.pro
@@ -3,7 +3,7 @@
 
 TARGET            = qwtplot3d
 TEMPLATE          = lib
-CONFIG           += qt warn_on opengl thread zlib debug
+CONFIG           += qt warn_on opengl thread zlib release
 MOC_DIR           = tmp
 OBJECTS_DIR       = tmp
 INCLUDEPATH       = include
@@ -21,7 +21,7 @@ win32:QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS_STL
 win32:CONFIG -= zlib
 
 linux-g++:TMAKE_CXXFLAGS += -fno-exceptions
-unix:VERSION = 0.2.6
+unix:VERSION = 0.2.7
 
 # Input
 SOURCES += src/qwt3d_axis.cpp \
@@ -93,3 +93,10 @@ zlib {
   win32:LIBS += zlib.lib
 	unix:LIBS  += -lz
 }
+
+target.path    = $$INSTALLBASE/lib 
+headers.path   = $$INSTALLBASE/include/qwtplot3d 
+doc.path       = $$INSTALLBASE/share/qwtplot3d/doc 
+headers.files  = $$HEADERS 
+
+INSTALLS       = target headers doc
-- 
1.8.4
