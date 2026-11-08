# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Tisket < Formula
  desc "Plaintext issue tracker for humans and coding agents"
  homepage "https://github.com/cjohnhanson/tisket"
  license "MIT"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2b2d897c43c46aabdfd836b152bff899e9d9858c58b9268f50a91efce4bcc073"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1205294abf4cdd0f75c0d0f15b7fa67b679139e49919d0710ae639566c60bbf8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e973e59359676e97fb63976a8450d205bf5e6c3cd367084c7330ce4111fa23f3"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6a10dc9f5578c4567021ada129baadf0e412691fa3dcd30e8d478deb1fcd4d75"
    end
  end

  def install
    bin.install "tisket"
    man1.install "man/tisket.1" if File.exist?("man/tisket.1")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tisket --version")
  end
end
