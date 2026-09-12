# The release workflow renders this template into the tap on every tag:
# it fills the version and the four checksums from the build's own
# archives, then pushes the result to cjohnhanson/homebrew-tap. Edit
# the formula here, never in the tap.
class Tisket < Formula
  desc "Plaintext issue tracker for humans and coding agents"
  homepage "https://github.com/cjohnhanson/tisket"
  license "MIT"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4ee99ba9a15e5a99bda6f5f44e253bbfdf28a4effab7c6e9a45eb4153f315731"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b71edd00d583254345c7f2ff16921c17a8cd004bfc64f75d0b1d3a4936d49d54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "862319c2720539e1f78f9cc6ba9ad4ba0efa9caf3260010f4f0e043b6ddc4a8f"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tisket/releases/download/v#{version}/tisket-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0e5f39983d091323ed0bd62c081bcb8889e092fe7d5eab89b19050e6072d2c2e"
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
