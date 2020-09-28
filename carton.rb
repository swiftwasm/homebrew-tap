class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"
  depends_on "wabt"

  stable do
    version "0.6.0"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "76c7197b5a73d36e1c264bff7b5eda9ccd65877337720b6ba3c2862970d501ea"
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
