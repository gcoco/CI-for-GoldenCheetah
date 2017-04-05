class Libkml < Formula
  desc "Reference implementation of OGC KML 2.2"
  homepage "https://github.com/google/libkml"
  url "https://github.com/libkml/libkml/archive/1.3.0.tar.gz"
  sha256 "8892439e5570091965aaffe30b08631fdf7ca7f81f6495b4648f0950d7ea7963"
  head "https://github.com/libkml/libkml.git"
  
  option "with-static", "Build static libraries"
#  option "with-python", "Build with python support"

  depends_on "cmake" => :build
#  depends_on "boost" => :build
#  depends_on "minizip" => :run
#  depends_on "uriparser" => :run
#  depends_on "python" => :optional
#  depends_on "swig" => :build if build.with? "python"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    args = std_cmake_args
    if build.with? "static"
       args << "-DBUILD_SHARED_LIBS:BOOL=OFF"
    end
    inreplace "cmake/External_zlib.cmake", "1.2.8", "1.2.11"
    inreplace "cmake/External_zlib.cmake", "44d667c142d7cda120332623eab69f40", "1c9f62f0778697a09d36121ead88e08e"

    system "cmake", ".", *args
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libkml-1.3.0`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
