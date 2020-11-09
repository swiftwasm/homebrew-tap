class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"

  stable do
    version "0.8.2"
    url "https://github.com/swiftwasm/carton.git", tag: "0.8.2", revision: "90d072a8897eb3e958314fe482f36d0ceb3e8dc5"
    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
  end

  bottle do
    root_url "https://github.com/swiftwasm/carton/releases/download/0.8.2"
    cellar :any
    sha256 "7986d3a6340e0e9b385ec160f1ca9c39d840165bd9a415114f17cd3b936bc6fb" => :catalina
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
