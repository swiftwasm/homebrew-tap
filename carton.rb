class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.0.3"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "45b84cfb31961032cf6bf4e168384c643c2216a3c5c8c25a7cc07bb877e0c23f"
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
