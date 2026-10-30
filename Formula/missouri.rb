# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Missouri < Formula
  desc "Show-me-state: e2e testing as directed graphs of filesystem states"
  homepage "https://github.com/cjohnhanson/missouri"
  license "MIT"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "45e8c3fedfce7fcac36f8a2c3320b043bca58a922d1b4ccb5ae274819a3741ba"
    end
    on_intel do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "da92c8a102afc7f5aa8187c40872a2e797a4c0fc4f8ba7821b1c3a3ae6636ca8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0adff090f9d8c510470725c6995e20fa83d8571af2758e159d557736de22cd48"
    end
    on_intel do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b2f6184ce0fcd8c5f6de4e4d16d6ac2edb26ff3eac0e22a4e22e4cb0e43bc45d"
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
