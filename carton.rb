class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.1.5"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "54ccbd45390d42109b4e2c9a2fd185149ff16d2665da480bfbef917c9b98386b"
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
