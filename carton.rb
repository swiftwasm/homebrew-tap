# typed: true
# frozen_string_literal: true

class Carton < Formula
  desc "Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  url "https://github.com/swiftwasm/carton.git", tag: "0.20.0", revision: "71653a2baef83108ae27854bf98fc8604d97b43b"
  head "https://github.com/swiftwasm/carton.git"

  bottle do
    root_url "https://github.com/swiftwasm/homebrew-tap/releases/download/carton-0.20.0"
    sha256 cellar: :any_skip_relocation, ventura: "456aacc96a83fda2257a00c0a704b46858e4e06868babd491fdcb703dd616d6f"
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
    system "#{bin}/carton", "-h"
  end
end
