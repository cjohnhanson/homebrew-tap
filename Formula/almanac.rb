# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Almanac < Formula
  desc "Almanac curates agent skills and indexes them for agents to read"
  homepage "https://github.com/cjohnhanson/almanac"
  license "MIT"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b094222a0ac9094c0f3509fdb57d3dd3da408ae97d56985c78b25c2799dd339c"
    end
    on_intel do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "492732545f29c47f22b81383d9ef3a0def5f50a4a2d091cab039df66dc552af0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f5d8ba62d6bae53aa9a5f033d9994af4bd4f54197f424e1087bc2b8886c4b24a"
    end
    on_intel do
      url "https://github.com/cjohnhanson/almanac/releases/download/v#{version}/almanac-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "abb7746a9be5cf4d3792f03092f290484e14bbfc0f22aed586e2f75a1013e74b"
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
