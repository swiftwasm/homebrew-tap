class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.3.0"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "7aedb9286c4517590e0a01dca987e3097518d3db3e8ba8d21bcce8cd30b9a8ca"
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
