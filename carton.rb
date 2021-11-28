# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.12.0"
    url "https://github.com/swiftwasm/carton.git", tag: "0.12.0", revision: "30a80d0db166db1bcce9797f5ef9a4f771cffca1"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"

    bottle do
      root_url "https://github.com/swiftwasm/carton/releases/download/0.12.0"

      sha256 cellar: :any, big_sur: "1821c6faafacd8a47322f264ec23591db62ca76389daf51b01eb11fe7b1dcc9a"
      sha256 cellar: :any, arm64_big_sur: "cdbe0f7ef613d8452480ef70062e6c80e03df9e03965c3ff4347311b99c45913"
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
