# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    url "https://github.com/swiftwasm/carton.git", tag: "0.17.0", revision: "3a00a0d79b50ed5367dd2c8131b14a9552066446"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
  end

  bottle do
    root_url "https://github.com/swiftwasm/homebrew-tap/releases/download/carton-0.17.0"
    sha256 cellar: :any_skip_relocation, monterey: "f224272d179cdef2f5b845291d3eb0ab76246a3da8fd113d9bc92f5d32120ff5"
  end

  depends_on "binaryen"

  depends_on "wasmer"

  depends_on xcode: "13.2.1"

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
