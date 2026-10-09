class FjordCli < Formula
  desc "Command-line tool and MCP server for Fjord, the local-first project manager"
  homepage "https://jhtjernsmo.github.io/fjord/"
  version "0.2.14"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64 # no Intel Mac binary yet

    on_arm do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-aarch64-apple-darwin"
      sha256 "1806bbefaf551994321ff5faafb99ae1504aa9e35fa9bab256bd5fc8d90d54e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-x86_64-unknown-linux-gnu"
      sha256 "8aaa818a9356f36e4cf07454f59e3dcfc254e6b147744554375ff094e5520312"
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
