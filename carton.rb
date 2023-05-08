# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    url "https://github.com/swiftwasm/carton.git", tag: "0.19.0", revision: "d2864bee744069cee3dbd816b07b160ce5e50dd3"
  end

  bottle do
    root_url "https://github.com/swiftwasm/homebrew-tap/releases/download/carton-0.19.0"
    sha256 cellar: :any_skip_relocation, monterey: "a24544150850f225b2c49dbbe0523b7ad9087607acac79fc905cb5dc2b5f5d1d"
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
