class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.1.2"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "00537c118e5f9e3bfcee529a8642fe8bccacdbae7f5287d79253e7f20a561634"
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
