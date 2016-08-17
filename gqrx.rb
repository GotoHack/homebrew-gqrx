require "formula"

class Gqrx < Formula
  homepage "http://gqrx.dk"
  url "https://github.com/csete/gqrx/archive/v2.5.tar.gz"
  sha256 "5134e5cf66e5133c12801547decad4b90dd7070a0283dd7b04f3ac0c69dd3b4e"

  head "https://github.com/csete/gqrx.git"

  depends_on "pkg-config" => :build
  depends_on "gnuradio"
  depends_on "librtlsdr"
  depends_on "gr-osmosdr"
  depends_on "qt"

  def install
    args = "PREFIX=#{prefix}"
    mkdir "build" do
      system "qmake", "..", *args
      system "make"
    end
    Dir.glob("build/*.app") { |app| mv app, prefix }
  end

  test do
    system "false"
  end
end
