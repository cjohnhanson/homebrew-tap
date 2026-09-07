# Written by the almanac release workflow. Edits here are overwritten.
class Almanac < Formula
  desc "Almanac curates agent skills and indexes them for agents to read"
  homepage "https://github.com/cjohnhanson/almanac"
  license "MIT"
  version "0.0.0"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-aarch64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-x86_64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    bin.install "almanac"
    # Both names install. The short name exists because a registry name
    # was taken, and the typed name is almanac.
    bin.install_symlink bin/"almanac" => "lmnc"
    man1.install "man/almanac.1" if File.exist?("man/almanac.1")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/almanac --version")
  end
end
