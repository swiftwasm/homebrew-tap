# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.11.1"
    url "https://github.com/swiftwasm/carton.git", tag: "0.11.1", revision: "43f23b498165b60ab8d24548202b6de0658283e5"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
    
    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.11.1"

      sha256 cellar: :any, catalina: "3c96c525694cbf4c6f644447629b7009a71be314309c1a8948abca874faa25fa"
      sha256 cellar: :any, big_sur: "2de4a8ef190425fd0a4908d1083b6cc9f7e1a1e7f48445ab399e949bd9981e7d"
      sha256 cellar: :any, arm64_big_sur: "e49359da08d6a51989b764ee6a591d35bd17a09695f9f9f233a018c972171400"
    end
  end

  depends_on "binaryen"

  depends_on "wasmer"

  depends_on xcode: "11.4"

  def install
    system "swift", "build",
           "--disable-sandbox",
           "-c", "release",
           "--build-path", buildpath.to_s

    system "install_name_tool",
           "-change", "@rpath/libSwiftPMDataModel.dylib",
           "@executable_path/../lib/libSwiftPMDataModel.dylib",
           buildpath/"release/carton"

    bin.install buildpath/"release/carton"
    lib.install buildpath/"release/libSwiftPMDataModel.dylib"
  end

  test do
    system "carton", "-h"
  end
end
