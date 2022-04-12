# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    version "0.14.1"
    url "https://github.com/swiftwasm/carton.git", tag: "0.14.1", revision: "8a73ca9a8793525afba115eff10bc5873f0506c8"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
    
    
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
