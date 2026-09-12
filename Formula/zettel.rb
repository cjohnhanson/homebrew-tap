# Written by the zettel release workflow. Edits here are overwritten.
class Zettel < Formula
  desc "Zettelkasten note management on frontmattered markdown"
  homepage "https://github.com/cjohnhanson/zettel"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cd118a6e05513040c282b669d5344da982e0ef79f79eea1809240aa83353bd74"
    end
    on_intel do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ea3db422d2f0497ce2fafcf9ef9b6ca90037f2e3228f42bb9681f6de06ca74fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3df725b37938cacf9ff080f8f915aeb222495116ec091ae76514ad7c652e2711"
    end
    on_intel do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7f299218f6a6f72fd206c6f9f9889544b06d745229a9dca311e6197247cb1b23"
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
