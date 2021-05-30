# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.10.0"
    url "https://github.com/swiftwasm/carton.git", tag: "0.10.0", revision: "0c918b50193ecb7afc6a2d562d3eb8f3739ee267"

    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.10.0"
      
      sha256 cellar: :any, catalina: "4992f7397691ead70ac44508fd6137bb6d440db235dd1da65b567f03fe7a73bb"
      sha256 cellar: :any, arm64_big_sur: "f7911944c2b8d00555bc65bfeb876283b333d230785e8d99530ab6296821e637"
    end

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
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
