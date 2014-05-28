require 'formula'

class Qwtplot3dQt5 < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://sintegrial.com/get.php?file=qwtplot3d_src'

  depends_on 'qt5'


  def install
    QT5_QMAKE = system "#{Formula['qt5'].opt_prefix}/bin/qmake"
    inreplace "qwtplot3d.pro", "qmake", "${QT5_QMAKE}"
    inreplace "qwtplot3d.pro", "static", "release"
    inreplace "qwtplot3d.pro", "0.3.0", "0.3.1"
    #inreplace "qwtplot3d.pro", "$$INSTALLBASE", prefix
    system "#{Formula['qt5'].opt_prefix}/bin/qmake"
    system "make install"
  end
end
