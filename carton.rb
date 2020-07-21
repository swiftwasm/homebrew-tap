class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.4.0"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "c5e2b59503bff1a878128cb9e794982eaec2f9f2f648c3c4db799d6e1caa504c"
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
