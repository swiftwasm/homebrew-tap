# typed: true
# frozen_string_literal: true

class Carton < Formula
  desc "Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  url "https://github.com/swiftwasm/carton.git", tag: "0.20.0", revision: "71653a2baef83108ae27854bf98fc8604d97b43b"
  head "https://github.com/swiftwasm/carton.git"

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
    system "#{bin}/carton", "-h"
  end
end
