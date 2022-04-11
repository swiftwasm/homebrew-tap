# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.14.0"
    url "https://github.com/swiftwasm/carton.git", tag: "0.14.0", revision: "2fad66cba200fc8bb3b0ca9e83800a9ab198f490"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.14.0"

      sha256 cellar: :any, monterey: "a4558bd055668e9f6e311d3d7b075a9a82ad3a3923b7487e4b81c93cd6fb0d93"
      sha256 cellar: :any, arm64_monterey: "bfe7414c5945de3f1aae6f86a17aa0dd5bd9b36a4c89f34fe2b75a53cf2cc1ee"
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
