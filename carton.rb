class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"

  stable do
    version "0.9.1"
    url "https://github.com/swiftwasm/carton.git", tag: "0.9.1", revision: "b47058f446e70701c1ee7fb96e9f1c1839e32f2c"
    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
  end

  

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/carton", "carton"
    bin.install "carton"
  end

  bottle do
    root_url "https://github.com/swiftwasm/carton/releases/download/0.9.1"
    cellar :any
    sha256 "83a78b915513a2571215eca41c6633c351d158602007d70d9d695b6a843face3" => :catalina
  end

  test do
    system "carton -h"
  end
end
