# Written by the missouri release workflow. Edits here are overwritten.
class Missouri < Formula
  desc "Show-me-state: e2e testing as directed graphs of filesystem states"
  homepage "https://github.com/cjohnhanson/missouri"
  license "MIT"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "877a1d5e833e456e8f6e03b99a940cfc09a95e0a29b362eb0b31ebf4750bc98f"
    end
    on_intel do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "65ed79c313dfd3dcc76c74aef31b54ce0b5cf592f117ac965cb78279be931a24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d5fcea79728fe054b617bcc4d601d1ae57e8cb5bc91d3a1f889386663c1b648a"
    end
    on_intel do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d60347bb99de084f3695c61d079a3c9489f02df6f29694d7ac5832ac1a4e9471"
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
