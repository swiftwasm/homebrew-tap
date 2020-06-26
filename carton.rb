class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.2.0"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "35e44746302d86cd69c6bf4cec4dc1488a7d802a0ac9ce50570a51acab3e22b7"
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
