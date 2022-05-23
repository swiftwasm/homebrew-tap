# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.15.2"
    url "https://github.com/swiftwasm/carton.git", tag: "0.15.2", revision: "8b44aa18b5de2b2ee34ac5e05182b4cbdd84b8ce"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.15.2"
      
      sha256 cellar: :any, arm64_monterey: "7a308c64b42050896c70ed9d8a70ac1d67cd231f2e268c185d3534d5e25e99ca"
      sha256 cellar: :any, monterey: "836a1a37a8af43b16d70f0a0eee07863e330d044d96ed898bff30b60c5244020"
    end
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
