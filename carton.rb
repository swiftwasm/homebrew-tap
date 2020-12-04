class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"

  stable do
    version "0.9.0"
    url "https://github.com/swiftwasm/carton.git", tag: "0.9.0", revision: "a7314cbb2e4662efe2c2356ae327ffc6cb8de17e"
    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
  end

  bottle do
    root_url "https://github.com/swiftwasm/carton/releases/download/0.9.0"
    cellar :any
    sha256 "868e223ffa7bf2d221540d6a82db2e5b279c1bbd399e704a153d8b02964ff8cb" => :big_sur
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
