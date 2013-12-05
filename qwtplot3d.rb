require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'
  sha1 '4463fafb8420a91825e165da7a296aaabd70abea'

  depends_on 'qt'

  def patches
    { 
      :p0 => [
        #https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
        "https://raw.github.com/gcoco/CI-for-GoldenCheetah/master/qwtplot3d.pro.patch",
        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff"
      ]
    }
  end
  
  def install
    inreplace "qwtplot3d.pro", "$$INSTALLBASE", "#{prefix}"
    system 'qmake -makefile -spec unsupported/macx-clang'
    system 'make install'
  end
end
