require "formula"

class Kf5Kconfig < Formula
  url "http://download.kde.org/stable/frameworks/5.1.0/kconfig-5.1.0.tar.xz"
  sha1 "a3a486696ccd650546560e86d51ee4e0540d1ee7"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kconfig.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"

    mkdir_p "#{HOMEBREW_PREFIX}/lib/kde5/libexec"
    ln_sf "#{lib}/kde5/libexec/kconf_update.app", "#{HOMEBREW_PREFIX}/lib/kde5/libexec/"
  end
end
