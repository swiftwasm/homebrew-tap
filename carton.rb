# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.15.0"
    url "https://github.com/swiftwasm/carton.git", tag: "0.15.0", revision: "81308996282b5a92a09e4c55ceb985e48b192839"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"

    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.15.0"

      sha256 cellar: :any, big_sur: "01c53ee9569c72c1c0ca03022ba4564e93f15aaf71928fe70628ed55a8d296f4"
      sha256 cellar: :any, arm64_monterey: "5240c5446518defc7e6c78ae9520b701a77b2cabe2bc02e811a5c57c4e5db920"
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
