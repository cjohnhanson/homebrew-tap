# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Missouri < Formula
  desc "Show-me-state: e2e testing as directed graphs of filesystem states"
  homepage "https://github.com/cjohnhanson/missouri"
  license "MIT"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "553d9ad5e87f22705dd980ed35ef1674261a590f752c0f4a23ed33d176f4ed8f"
    end
    on_intel do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "45d1474cbe59d18df55662856b291fcd7b645d175b0041481571b48e9d127e9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bd9d95a7982c2fb8103e4ba2e173320e30033fed524242c4c80cbd609a1c54d0"
    end
    on_intel do
      url "https://github.com/cjohnhanson/missouri/releases/download/v#{version}/missouri-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4db5e6c2b736edfca38bb26ddefb3ecbde1e4274d1447edb088362d3562dff2d"
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
