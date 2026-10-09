class FjordCli < Formula
  desc "Command-line tool and MCP server for Fjord, the local-first project manager"
  homepage "https://jhtjernsmo.github.io/fjord/"
  version "0.2.15"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64 # no Intel Mac binary yet

    on_arm do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-aarch64-apple-darwin"
      sha256 "f9312711cc18fd3575e149cf792ebbe4366a02ee90469ee3958d6af656825ad6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-x86_64-unknown-linux-gnu"
      sha256 "ef6c19402c8f61110fb1f755a8b8201c3cfdd812503d51cb469990556412b449"
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
