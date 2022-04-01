# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.12.2"
    url "https://github.com/swiftwasm/carton.git", tag: "0.12.2", revision: "7bd54d6c0c7f4fd37204142613e19aeeb543deaa"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
    
    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.12.2"

      sha256 cellar: :any, big_sur: "96a62dc27451d2356cc9bbbb1bb5f837d7f4ab038ac143e9d9f4c5f39825b87b"
      sha256 cellar: :any, arm64_big_sur: "8ed4ab57985b2ba04c87d0ff68bcb29c0377a73774b5f9d3025502f81dd54f30"
    end
  end

  depends_on "binaryen"

  depends_on "wasmer"

  depends_on xcode: "12.5"

  def install
    system "swift", "build",
           "--disable-sandbox",
           "-c", "release",
           "--build-path", buildpath.to_s

    bin.install buildpath/"release/carton"
  end

  test do
    system "carton", "-h"
  end
end
