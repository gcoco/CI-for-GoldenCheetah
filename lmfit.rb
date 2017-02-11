class Lmfit < Formula
  homepage "http://apps.jcns.fz-juelich.de/doku/sc/lmfit"
  url "http://apps.jcns.fz-juelich.de/src/lmfit/lmfit-6.1.tgz"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
    (pkgshare/"demos").install Dir["demo/*.c"]
  end

  def caveats
    "Demo sources have been placed in " + (share/"lmfit/demos")
  end

  test do
    # curve1.c tests lmcurve.h
    system ENV.cc, (pkgshare/"demos/curve1.c"), "-I#{include}", "-L#{lib}", "-llmfit", "-o", "curve1"
    system "./curve1"
    # surface1.c tests lmmin.h
    system ENV.cc, (pkgshare/"demos/surface1.c"), "-I#{include}", "-L#{lib}", "-llmfit", "-o", "surface1"
    system "./surface1"
  end
