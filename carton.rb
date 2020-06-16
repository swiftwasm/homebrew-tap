class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.0.5"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "818c6f5cb2b9b861d6874a57bc441c17ca2a75a0bb0262a9dd030d48eab10902"
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
