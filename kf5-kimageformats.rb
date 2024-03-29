require "formula"

class Kf5Kimageformats < Formula
  url "http://download.kde.org/stable/frameworks/5.1.0/kimageformats-5.1.0.tar.xz"
  sha1 "2e7a531fc08fc63ee652f5f52addf384105587a9"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kimageformats.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
