# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.12.1"
    url "https://github.com/swiftwasm/carton.git", tag: "0.12.1", revision: "b3b060d625972093b72bb6273956a8c5297c217a"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
    
    bottle do
      sha256 cellar: :any, big_sur: "0118a1ac2562174ae78abdcdaf1f32ceb5161bea3d1b66a1925c87e4cfdeb9c0"
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
