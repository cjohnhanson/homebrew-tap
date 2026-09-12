# Written by the tisket release workflow. Edits here are overwritten.
class Tisket < Formula
  desc "Plaintext issue tracker for humans and coding agents"
  homepage "https://github.com/cjohnhanson/tisket"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c5a11efa452309190544e06a434eb0c4338b0bbcdd5c9be7d8e57e1834cd7862"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6b0c6c5fe0cd594f9e791afe1518d89535f6ceefd390ebec86ad1b037e441deb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "76a2351a9bae564f045b69c0d3ac0458b1797b67a62df490ad1a52b00d8ed097"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3cdea453ef4ba9c7a095919c485caa4c52a9ca45d5464db6c5c283137bae3660"
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
