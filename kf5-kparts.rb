require "formula"

class Kf5Kparts < Formula
  url "http://download.kde.org/stable/frameworks/5.1.0/kparts-5.1.0.tar.xz"
  sha1 "ada0955fc87a88f9ce65e3713d7823e993fb2014"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kparts.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "haraldf/kf5/kf5-kjs"
  depends_on "haraldf/kf5/kf5-ki18n"
  depends_on "haraldf/kf5/kf5-kguiaddons"
  depends_on "haraldf/kf5/kf5-kcoreaddons"
  depends_on "haraldf/kf5/kf5-kauth"
  depends_on "haraldf/kf5/kf5-kcodecs"
  depends_on "haraldf/kf5/kf5-kconfig"
  depends_on "haraldf/kf5/kf5-kconfigwidgets"
  depends_on "haraldf/kf5/kf5-kdbusaddons"
  depends_on "haraldf/kf5/kf5-kservice"
  depends_on "haraldf/kf5/kf5-kcompletion"
  depends_on "haraldf/kf5/kf5-kwindowsystem"
  depends_on "haraldf/kf5/kf5-kitemviews"
  depends_on "haraldf/kf5/kf5-kwidgetsaddons"
  depends_on "haraldf/kf5/kf5-kiconthemes"
  depends_on "haraldf/kf5/kf5-solid"
  depends_on "haraldf/kf5/kf5-kglobalaccel"
  depends_on "haraldf/kf5/kf5-sonnet"
  depends_on "haraldf/kf5/kf5-attica"
  depends_on "haraldf/kf5/kf5-kbookmarks"
  depends_on "haraldf/kf5/kf5-kjobwidgets"
  depends_on "haraldf/kf5/kf5-kio"
  depends_on "haraldf/kf5/kf5-kxmlgui"
  depends_on "haraldf/kf5/kf5-ktextwidgets"
  depends_on "haraldf/kf5/kf5-knotifications"

  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
