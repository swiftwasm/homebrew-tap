# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.16.0"
    url "https://github.com/swiftwasm/carton.git", tag: "0.16.0", revision: "29a9b587b23e05653a6eab13af9ef77e4617f600"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.16.0"
      
      sha256 cellar: :any, arm64_monterey: "60ff2f7d79146848bfd7853d2647a593d482f8601716d5e361530c4de613d7ce"
      sha256 cellar: :any, monterey: "4dbb69d5cc861709566680e045cfcca2b16d1999a3867714a1591d7f39b155d3"
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
