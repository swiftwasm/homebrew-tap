# typed: true
# frozen_string_literal: true

class Carton < Formula
  desc "Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  url "https://github.com/swiftwasm/carton.git", tag: "0.20.1", revision: "33ef59df6f00bf133f63cb0f4f21633ca8a4cfb4"
  head "https://github.com/swiftwasm/carton.git"

  bottle do
    root_url "https://github.com/swiftwasm/homebrew-tap/releases/download/carton-0.20.1"
    sha256 cellar: :any_skip_relocation, ventura: "4738efe3e5aa6479b5b68c8457e27c16f02ab8fa76e06102b71e40cde890a4e9"
  end

  deprecate! date: "2024-03-09", because: "deprecated Homebrew installation from 1.0.0. Please install the new version as a SwiftPM dependency instead (https://github.com/swiftwasm/carton#installation)"

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
