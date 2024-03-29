require "formula"

class Kf5Kwindowsystem < Formula
  url "http://download.kde.org/stable/frameworks/5.1.0/kwindowsystem-5.1.0.tar.xz"
  sha1 "5ac612ce14d38056deffc64725942d5e33bf932b"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kwindowsystem.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE -DQT_MAC_USE_COCOA'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
