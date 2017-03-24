class Libkml < Formula
  desc "Reference implementation of OGC KML 2.2"
  homepage "https://github.com/google/libkml"
  url "https://github.com/libkml/libkml/archive/1.3.0.tar.gz"
  sha256 "8892439e5570091965aaffe30b08631fdf7ca7f81f6495b4648f0950d7ea7963"
  ## head "https://github.com/libkml/libkml.git"
  head "https://github.com/rashadkm/libkml.git"

  depends_on :python => :recommended
  depends_on "cmake" => :build
  depends_on "boost" => :run
  depends_on "uriparser" => :run
  depends_on "minizip" => :run
  depends_on "swig" => :build if build.with?("python")

  def install
    args = std_cmake_args
    if build.with? "python"
      args << "-DWITH_SWIG:BOOL=ON"
      args << "-DWITH_PYTHON:BOOL=ON"
    end

    system "cmake", ".", *args
    system "make"
    system "make", "install"

  end
end
