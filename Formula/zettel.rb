# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Zettel < Formula
  desc "Zettelkasten note management on frontmattered markdown"
  homepage "https://github.com/cjohnhanson/zettel"
  license "MIT"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "578ae823cebec4fedf2330f59ef6d41a30e615b9cd89995da259aae4a8a4257a"
    end
    on_intel do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3e740b09de85fd5d42549af1c0b3fac88b913cb6238ea0297e0d3eeafffab5ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cb1871c8d77ad8bfc9573798549f7d35615cf6927b4133c7eff267bb3bbc5577"
    end
    on_intel do
      url "https://github.com/cjohnhanson/zettel/releases/download/v#{version}/zettel-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec33b1bf1875f54743a70015eb8ae687cde4ef9622fe2831b51853ecccb5f228"
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
