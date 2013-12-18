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
--- a/qwtplot3d.pro
+++ b/qwtplot3d.pro
@@ -1,7 +1,13 @@
 # pro file for building the makefile for qwtplot3d
 #
 
-TARGET            = qwtplot3d
+TARGET            = qwtplot3d-qt4
+# Install directives
+INSTALLBASE	  = /usr
+headers.path      = $$INSTALLBASE/include/qwtplot3d-qt4
+headers.files     = $$HEADERS
+target.path       = $$INSTALLBASE/lib
+INSTALLS          = doc headers target
 TEMPLATE          = lib
 CONFIG           += qt warn_on opengl thread zlib debug
 MOC_DIR           = tmp
@@ -87,9 +93,11 @@
 SOURCES+=src/qwt3d_io_gl2ps.cpp \
          3rdparty/gl2ps/gl2ps.c
 
+unix:LIBS  += -lGLU
+
 # zlib support for gl2ps
 zlib {
   DEFINES += GL2PS_HAVE_ZLIB
   win32:LIBS += zlib.lib
 	unix:LIBS  += -lz
-}
\ No newline at end of file
+}
