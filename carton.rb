# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.15.1"
    url "https://github.com/swiftwasm/carton.git", tag: "0.15.1", revision: "4314a92adc7b50764f0e7922955d6b8b3b90404b"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"

    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.15.1"

      sha256 cellar: :any, big_sur: "6276b3880a6d5201eba5dbf9f405bc642cd13167cb7fb95abc096e2a89144e38"
      sha256 cellar: :any, arm64_monterey: "d3e4738bf0a9bc32e452e3e58cae2efd8aeaec9e51db71ba82964e7718086ffc"
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
