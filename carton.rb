class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.0.4"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "7891d6e519f471d60aa7aaab431a03620cc1db487500a0d82ce374954cd11f08"
  end

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/carton", "carton"
    bin.install "carton"
  end

  test do
    system "carton -h"
  end
end
