require 'formula'

class Qwtplot3dQt5 < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://sintegrial.com/get.php?file=qwtplot3d_src'
  sha1 '944596fbac3c5ff94e2e8e0908cc831855e917a1'
  version '0.3.1_322'

  depends_on 'qt5'

  def install
    inreplace "qwtplot3d.pri", "TARGET = qwtplot3d", "TARGET = qwtplot3d-qt5"
    inreplace "config.pri", "static", "release"
    inreplace "include/qwt3d_openglhelper.h", "GL/glu.h", "OpenGL/glu.h"
    system "echo VERSION = 0.3.1_322 >> config.pri""
    system "echo target.path    = \\$\\$INSTALLBASE/lib >> config.pri"
    system "echo headers.path   = \\$\\$INSTALLBASE/include/qwtplot3d-qt5 >> config.pri"
    system "echo doc.path       = \\$\\$INSTALLBASE/share/qwt/doc >> config.pri"
    system "echo headers.files  = \\$\\$HEADERS >> config.pri"
    system "echo INSTALLS       = target headers doc >> config.pri"
    system "cat config.pri qwtplot3d.pri"
    inreplace "config.pri", "$$INSTALLBASE", prefix
    system "#{Formula['qt5'].opt_prefix}/bin/qmake"
    system "make install"
  end
end
