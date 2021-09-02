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
