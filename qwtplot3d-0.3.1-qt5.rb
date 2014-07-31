require 'formula'

class Qwtplot3d031Qt5 < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://sintegrial.com/get.php?file=qwtplot3d_src'
  version '0.3.1'

  depends_on 'qt5'


  def install
    inreplace "qwtplot3d.pro", "qwtplot3d", "qwtplot3d-qt5"
    inreplace "qwtplot3d.pro", "static", "release"
    inreplace "qwtplot3d.pro", "0.3.0", "0.3.1"
    system "echo target.path    = $$INSTALLBASE/lib >> qwtplot3d.pro"
    system "echo headers.path   = $$INSTALLBASE/include/qwtplot3d >> qwtplot3d.pro"
    system "echo doc.path       = $$INSTALLBASE/share/qwt/doc >> qwtplot3d.pro"
    system "echo headers.files  = $$HEADERS >> qwtplot3d.pro"
    system "echo INSTALLS       = target headers doc >> qwtplot3d.pro"
    inreplace "qwtplot3d.pro", "$$INSTALLBASE", prefix
    system "#{Formula['qt5'].opt_prefix}/bin/qmake"
    system "cat qwtplot3d.pro"
    system "make install"
  end
end
