class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.3.1"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "8d69a3c49af44e6b327d8de88df2e83c0ceaf31c114bf356821bfae75c6d5c59"
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
