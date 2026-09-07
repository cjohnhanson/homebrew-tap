# Written by the zettel release workflow. Edits here are overwritten.
class Zettel < Formula
  desc "Zettelkasten note management on frontmattered markdown"
  homepage "https://github.com/cjohnhanson/zettel"
  license "MIT"
  version "0.0.0"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-aarch64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-x86_64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    bin.install "zettel"
    # Both names install. The short name exists because a registry name
    # was taken, and the typed name is zettel.
    bin.install_symlink bin/"zettel" => "zttl"
    man1.install "man/zettel.1" if File.exist?("man/zettel.1")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zettel --version")
  end
end
