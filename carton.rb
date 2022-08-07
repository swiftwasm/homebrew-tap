# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    url "https://github.com/swiftwasm/carton.git", tag: "0.16.1", revision: "9c0abbf013a01e163038f259d2787aa4baddbdcb"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
  end

  bottle do
    root_url "https://github.com/swiftwasm/homebrew-tap/releases/download/carton-0.16.1"
    sha256 cellar: :any_skip_relocation, monterey: "57583e3507619f73fe3d6ba822ce63ad9d4a78956c796d2db169d64b20bef2c9"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "3009368dfc1a23368908d566a0f3fe3e85dac79ce7bfcd8f142ffe4e7efe23ca"
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
