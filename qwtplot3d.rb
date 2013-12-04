require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
#  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.zip'
#  sha1 '17f55d37ac93fd17d7f3f6b90031ceb796bfe6d1'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'
  sha1 '4463fafb8420a91825e165da7a296aaabd70abea'

#  depends_on 'qt'
  
  def patches
    { :"-dry-run --unified" => [
    #"https://raw.github.com/gcoco/CI-for-GoldenCheetah/master/qwtplot3d.pro.patch"
    DATA
    ]}
  end
  
  def install
    system "qmake CONFIG+=release"
    system 'make install'
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
 INCLUDEPATH       = include
