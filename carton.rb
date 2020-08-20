class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"

  stable do
    version "0.5.0"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "ce104dde77632491a70fa70167695cba71a78c396c240a17c4229668fe040708"
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
