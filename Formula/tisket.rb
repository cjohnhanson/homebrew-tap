# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Tisket < Formula
  desc "Plaintext issue tracker for humans and coding agents"
  homepage "https://github.com/cjohnhanson/tisket"
  license "MIT"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "311a887c64758a807cad0017cc365e2f454a9af085a95e0c7096bf792583b93f"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2b7a969efa5faf176adfe03c8330e134647b31333bcacc78dfb3bb366b77310e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4896549322e85921bbe39592898a2f9f34610667bf529d1b90e97f192c1e664e"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7fd5f05f8978a43cf3bdb7bc6cda8d77a07b162e477e0136bc726c6e1d6b1935"
    end
  end

  def install
    bin.install "tisket"
    man1.install "man/tisket.1" if File.exist?("man/tisket.1")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tisket --version")
  end
end
