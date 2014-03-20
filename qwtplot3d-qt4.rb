require 'formula'

class Qwtplot3dQt4 < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'
  sha1 '4463fafb8420a91825e165da7a296aaabd70abea'

  depends_on "qt"

  def patches
    {
      :p0 => [
        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff"
      ]
    }
  end

  def install
    inreplace "qwtplot3d.pro", "$$INSTALLBASE", "#{Formula['qt'].opt_prefix}"
    inreplace "qwtplot3d.pro", "qwtplot3d", "qwtplot3d-qt4"
    system "cat qwtplot3d.pro"
    system "#{Formula['qt'].opt_prefix}/bin/qmake"
    system "make install"
  end
end
