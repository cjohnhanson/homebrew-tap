# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Zettel < Formula
  desc "Zettelkasten note management on frontmattered markdown"
  homepage "https://github.com/cjohnhanson/zettel"
  license "MIT"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5aa54249cadd200aab08f33879e9ea5528c801ddf011a7c2a3cae5d2cfac41be"
    end
    on_intel do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "949c2cc307b5bf47973b999ac71ac2ee61da973862e6a327dbb8d1c4f5e11cd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9787e671b1edd010f64f741bb2f1cc533851ca5a8bf06c70f4d578b34433c3b7"
    end
    on_intel do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "109836fc04af617c1264245fcf45359e86e13f2a9b99d100eb5452a0e6edf868"
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
