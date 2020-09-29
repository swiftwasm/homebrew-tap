class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"
  depends_on "wabt"

  stable do
    version "0.6.1"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "9a45943e6cb0d9516fdd205d94a0f025a52a62d50f4861dcb8ad9897bbc10ba8"
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
