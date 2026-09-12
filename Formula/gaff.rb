# Written by the gaff release workflow. Edits here are overwritten.
class Gaff < Formula
  desc "A context-lifecycle handler for coding agents"
  homepage "https://github.com/cjohnhanson/gaff"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/gaff/releases/download/v#{version}/gaff-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "70f81745c735796cc994cbb4b864a5e68fe2660f6532557540819301715cbb49"
    end
    on_intel do
      url "https://github.com/cjohnhanson/gaff/releases/download/v#{version}/gaff-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b8b8b566b8a90021322e22a900353cb44e2d3949a8fb6fb39c5f9c62659aeb32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/gaff/releases/download/v#{version}/gaff-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f30bd6427fe5b7a433628654c3523dc31eb5422c94a3a22b69f36e37e99ac304"
    end
    on_intel do
      url "https://github.com/cjohnhanson/gaff/releases/download/v#{version}/gaff-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "11418461c1fdc6d2be53d22362f73ff76930e5297e52dd25eea0a1716dc305b6"
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
