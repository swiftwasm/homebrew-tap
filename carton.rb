class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.4.0"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "18a2f7e7c61b06af7ca2ddeab47813327ebd624dbf1747249515591f464270aa"
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
