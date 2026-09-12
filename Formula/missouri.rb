# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Missouri < Formula
  desc "Show-me-state: e2e testing as directed graphs of filesystem states"
  homepage "https://github.com/cjohnhanson/missouri"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "76444c8a9cbc60b408cc5650bfdac7062ec1557bec49624983308a050202cc50"
    end
    on_intel do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "75f0d4379879e69aa34c896cbdf7a459943dc2be617b9564bed545579af4a8fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fbca4cf7d569a6ce57a6dd92e81cd3981a19ca7c231bf6ba226b48bd175124fd"
    end
    on_intel do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f5708b4c31c540aa6d06e55c67b1d1729c1a347c68221fdad58199eb31e16f44"
    end
  end

  def install
    bin.install "missouri"
    # Both names install. The short name exists because a registry name
    # was taken, and the typed name is missouri.
    bin.install_symlink bin/"missouri" => "msri"
    man1.install "man/missouri.1" if File.exist?("man/missouri.1")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/missouri --version")
  end
end
