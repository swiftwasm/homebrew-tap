# typed: false
# frozen_string_literal: true

class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  stable do
    url "https://github.com/swiftwasm/carton.git", tag: "0.18.0", revision: "f2a83a28bb03caa94784a4500e4f02f20b442306"

    sha256 "bdf9e259e9abb9d2ff9b68380b08a29c7c4f6a4b1114473593c3fc8afe33e574"
  end

  bottle do
    root_url "https://github.com/swiftwasm/homebrew-tap/releases/download/carton-0.18.0"
    sha256 cellar: :any_skip_relocation, monterey: "c67e6aefd609dcad83792af00dd8753cd6d8554cce8542b30f0a04206608530a"
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
