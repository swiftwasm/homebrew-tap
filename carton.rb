class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"
  depends_on "wabt"

  stable do
    version "0.7.1"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "157a480bc6e1eb3c88fd090b43b7a930890b42873305a41104e28104b2579aba"
  end

  bottle do
    root_url "https://github.com/swiftwasm/carton/releases/download/0.7.1"
    cellar :any
    sha256 "0ec64f927675d38d136bc1f27dab1aa313b7561595aec51c6e22882b3c2b7f26" => :catalina
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
