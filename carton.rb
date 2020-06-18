class Carton < Formula
  desc "📦 Watcher, bundler, and test runner for your SwiftWasm apps"
  homepage "https://carton.dev"
  head "https://github.com/swiftwasm/carton.git"

  depends_on :xcode => "11.4"

  stable do
    version "0.1.1"
    url "https://github.com/swiftwasm/carton/archive/#{version}.tar.gz"
    sha256 "4f289efa3f8b46f6ad37c5032e67a141de389694c7b9d6386690c6c456e2cea6"
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
