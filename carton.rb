# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.10.0"
    url "https://github.com/swiftwasm/carton.git", tag: "0.10.0", revision: "0c918b50193ecb7afc6a2d562d3eb8f3739ee267"

bottle do
    root_url "https://github.com/swiftwasm/carton/releases/download/0.10.0"
    
    sha256 cellar: :any, catalina: "d89552e7a6fac267deddb3801eec64720c60eb53a8b326018972c06d1c4c88f2"
  end

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
  end

  

  depends_on "binaryen"

  depends_on "wasmer"

  depends_on xcode: "11.4"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/carton", "carton"
    bin.install "carton"
  end

  test do
    system "carton", "-h"
  end
end
