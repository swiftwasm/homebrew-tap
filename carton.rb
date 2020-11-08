class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"
  depends_on "wasmer"
  depends_on "binaryen"

  stable do
    version "0.8.0"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "d678aba99a1240fb5b68898509f2c8e40b02d23e6fe199eafa2ee95ba43c1079"
  end

  bottle do
    root_url "https://homebrew.bintray.com/bottles-tap"
    cellar :any_skip_relocation
    sha256 "9c4a09edfd1e1387c7302d722fd79de4aa9e84d94d9a411939c7fbd8b624a95c" => :catalina
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
