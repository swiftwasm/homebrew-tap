class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.1.4"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "dc847d0d0c9b3df547aeb6ab85aa9bb773ba4cf65da6063762957a2eef5e7b43"
  end

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/carton", "carton"
    bin.install "carton"
  end

  test do
    system "carton -h"
  end
end
