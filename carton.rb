class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"
  depends_on "wabt"

  stable do
    version "0.7.0"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "e2cf209905c98fe07610a009dd831a82b65a0e1002c3ee025b5ac1868e052d65"
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
