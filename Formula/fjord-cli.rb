class FjordCli < Formula
  desc "Command-line tool and MCP server for Fjord, the local-first project manager"
  homepage "https://jhtjernsmo.github.io/fjord/"
  version "0.2.29"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64 # no Intel Mac binary yet

    on_arm do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-aarch64-apple-darwin"
      sha256 "4bb4b2b2b34d4b025a5201c07aa1f80574a481537a13d54e709d019864757cfd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-x86_64-unknown-linux-gnu"
      sha256 "937817e338d6f5159d68cd0e8cd93ae49387af7cb487c86f4c9af733abf6c2b3"
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
