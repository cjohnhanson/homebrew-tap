# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Tundish < Formula
  desc "Local inbox that agents subscribe to"
  homepage "https://github.com/cjohnhanson/tundish"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/tundish/releases/download/v#{version}/tundish-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "36a0133a04c74874fd30f02416547574233e4e4f1065894e146c484c51b95515"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tundish/releases/download/v#{version}/tundish-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f74dca1f37db94fef2e7eae41e260d5f4d0b41b197fdecad6ab32a0c9276cc0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/tundish/releases/download/v#{version}/tundish-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7a574437c21fe1797ded28fe325a6a4be1d84dd86c18b79dc6f5b43ed9c4b9b0"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tundish/releases/download/v#{version}/tundish-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b4b4a66559797012561aa62f37ae79683b0fab6f1f00f9baf10600076fe64a83"
    end
  end

  def install
    bin.install "tundish"
    man1.install Dir["man/*.1"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tundish --version")
  end
end
