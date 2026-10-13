class FjordCli < Formula
  desc "Command-line tool and MCP server for Fjord, the local-first project manager"
  homepage "https://jhtjernsmo.github.io/fjord/"
  version "0.2.26"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64 # no Intel Mac binary yet

    on_arm do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-aarch64-apple-darwin"
      sha256 "68c3503503c329729222aacc22eb60282d46ecf8b4d810385da6e2ad1900d17d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-x86_64-unknown-linux-gnu"
      sha256 "ca02d5648224468984ed0b6f2748008707f8416b713f87cc577c63545a97f6be"
    end
  end

  livecheck do
    url "https://github.com/jhtjernsmo/fjord"
    strategy :github_latest
  end

  def install
    binary = Dir["fjord-cli-*"].first
    bin.install binary => "fjord"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fjord --version")
  end
end
