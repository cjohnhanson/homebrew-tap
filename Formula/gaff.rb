# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Gaff < Formula
  desc "A context-lifecycle handler for coding agents"
  homepage "https://github.com/cjohnhanson/gaff"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/gaff/releases/download/v#{version}/gaff-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cab5d243fbea5bc071f9e17153525f6e247f673a15f588c52a71eace26aef03b"
    end
    on_intel do
      url "https://github.com/cjohnhanson/gaff/releases/download/v#{version}/gaff-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2cedb683e3ae7b7b62f71a9bb4787cb5579d100e275b54a32c89eb36ae8ae8d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/gaff/releases/download/v#{version}/gaff-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "69e9dc41cfffcd3aa0e2f904623b363fb9cb09d757036e63e3cdefa3d8fc9d0b"
    end
    on_intel do
      url "https://github.com/cjohnhanson/gaff/releases/download/v#{version}/gaff-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "155b63171de75f8ed338d4169ed782980bbe1a6716550fe05738d8880049805e"
    end
  end

  def install
    bin.install "gaff"
    # Both names install. The short name exists because a registry name
    # was taken, and the typed name is gaff.
    bin.install_symlink bin/"gaff" => "gaffr"
    man1.install "man/gaff.1" if File.exist?("man/gaff.1")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gaff --version")
  end
end
