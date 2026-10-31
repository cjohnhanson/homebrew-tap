class Tundish < Formula
  desc "Local inbox that agents subscribe to"
  homepage "https://github.com/cjohnhanson/tundish"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/cjohnhanson/tundish/releases/download/v#{version}/tundish-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "98ce9410ae0ced4761af79935d3f5c69db1f26eea4c5e1171d4e035eea3cbede"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tundish/releases/download/v#{version}/tundish-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9cbd5d6058bb2dee1a5a7834fe57a4d80ace0af6cda269644bd69664cdb9f521"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cjohnhanson/tundish/releases/download/v#{version}/tundish-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dcc1b3b27504bf6e302f76b7d2d04b9d53384d8ad772aa5125ae2a1461dba22c"
    end
    on_intel do
      url "https://github.com/cjohnhanson/tundish/releases/download/v#{version}/tundish-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dd20593c93c10315f5c25c5850f2888efdec0af918dd225dad5d02faeffc75e9"
    end
  end

  def install
    bin.install "tundish"
    man1.install Dir["man/*.1"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tundish --version")
  end
end
