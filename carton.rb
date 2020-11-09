class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"

  stable do
    version "0.8.1"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
  end

  bottle do
    root_url "https://github.com/swiftwasm/carton/releases/download/0.8.1"
    cellar :any
    sha256 "310b33287f7ab8bdeb569a815bf95adcfe4ec7e1e5c79f63240dcc488f201a13" => :catalina
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
