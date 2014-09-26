require 'formula'

class Qwtplot3dQt5 < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://sintegrial.com/get.php?file=qwtplot3d_src'
  sha1 '944596fbac3c5ff94e2e8e0908cc831855e917a1'
  version '0.3.1_322'

  depends_on 'qt5'

  def install
    inreplace "qwtplot3d.pro", "qwtplot3d", "qwtplot3d-qt5"
    inreplace "qwtplot3d.pro", "static", "release"
    inreplace "qwtplot3d.pro", "0.3.0", "0.3.1"
    inreplace "include/qwt3d_openglhelper.h", "GL/glu.h", "OpenGL/glu.h"
    system "echo target.path    = \\$\\$INSTALLBASE/lib >> qwtplot3d.pro"
    system "echo headers.path   = \\$\\$INSTALLBASE/include/qwtplot3d-qt5 >> qwtplot3d.pro"
    system "echo doc.path       = \\$\\$INSTALLBASE/share/qwt/doc >> qwtplot3d.pro"
    system "echo headers.files  = \\$\\$HEADERS >> qwtplot3d.pro"
    system "echo INSTALLS       = target headers doc >> qwtplot3d.pro"
    inreplace "qwtplot3d.pro", "$$INSTALLBASE", prefix
    system "#{Formula['qt5'].opt_prefix}/bin/qmake"
    system "make install"
  end
end
