require 'formula'

class Lmfit < Formula
  desc "A self-contained C library for Levenberg-Marquardt least-squares minimization and curve fitting."
  homepage "http://apps.jcns.fz-juelich.de/doku/sc/lmfit"
  url "http://apps.jcns.fz-juelich.de/src/lmfit/lmfit-6.1.tgz"
  sha256 "54366788400e3b1eb47cff44c9dae9906da079400cec2df2fb0b865c9e04c6a0"
  
 def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
    (pkgshare/"demos").install Dir["demo/*.c"]
  end

  def caveats
    "Demo sources have been placed in " + (pkgshare/"lmfit/demos")
  end

  test do
    # curve1.c tests lmcurve.h
    system ENV.cc, (pkgshare/"demos/curve1.c"), "-I#{include}", "-L#{lib}", "-llmfit", "-o", "curve1"
    system "./curve1"
    # surface1.c tests lmmin.h
    system ENV.cc, (pkgshare/"demos/surface1.c"), "-I#{include}", "-L#{lib}", "-llmfit", "-o", "surface1"
    system "./surface1"
  end
end
