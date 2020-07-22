class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"

  stable do
    version "0.4.1"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "23f79f05c9da183640238454fdcfb8761c8656f6ed72d6d7780afc9d184eafc9"
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
