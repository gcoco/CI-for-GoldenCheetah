require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
#  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.zip'
#  sha1 '17f55d37ac93fd17d7f3f6b90031ceb796bfe6d1'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'
  sha1 '4463fafb8420a91825e165da7a296aaabd70abea'

  depends_on 'qt'

  def patches
    { :"-debug=3" => [
      "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff"
      ]
    }
    #{
     # :p0 => [
      #"https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff"
#    #DATA
       #]
  #  }
  end
  
  def install
    system "qmake -makefile -spec unsupported/macx-clang CONFIG+=release"
    system 'make'
  end
end

__END__
diff --git a/qwtplot3d.pro b/qwtplot3d.pro.diff
index 4060fe8..b0e8aa6 100644
--- a/qwtplot3d.pro
+++ b/qwtplot3d.pro.diff
@@ -3,7 +3,7 @@
 
 TARGET            = qwtplot3d
 TEMPLATE          = lib
-CONFIG           += qt warn_on opengl thread zlib debug
+CONFIG           += qt warn_on opengl thread zlib release
 MOC_DIR           = tmp
 OBJECTS_DIR       = tmp
