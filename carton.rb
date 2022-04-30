# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.14.2"
    url "https://github.com/swiftwasm/carton.git", tag: "0.14.2", revision: "0b44e11222679d493b0fce67fc68511b4246a529"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
    
    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.14.2"

      sha256 cellar: :any, big_sur: "72fbaeb80e44f92dd038a96abc327d36b30539d2228aab8d93e67a069e6572c8"
      sha256 cellar: :any, arm64_monterey: "c50367aed782811402a5cc2e114fc54da305a8f7dfae233ee4895b74b7f8608e"
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
