# Written by the almanac release workflow. Edits here are overwritten.
class Almanac < Formula
  desc "Almanac curates agent skills and indexes them for agents to read"
  homepage "https://github.com/cjohnhanson/almanac"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7c94791166873672bf80cfd381f3b452b06fd3cd92114ce887a2243b9d831c06"
    end
    on_intel do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c758de3256d6079e78cd33057ea3807865f8aa350ca5daea2890c2c73e553150"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7ed08d37cde85c2d986222998665d75390a9016a6607f6968e07df09507add34"
    end
    on_intel do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9bb23bd7167a0a114d2fa741b50be7fc4ca9f61bbc91e7e0c45bb5a208ea3fe4"
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
