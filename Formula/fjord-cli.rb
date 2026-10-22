class FjordCli < Formula
  desc "Command-line tool and MCP server for Fjord, the local-first project manager"
  homepage "https://jhtjernsmo.github.io/fjord/"
  version "0.2.30"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64 # no Intel Mac binary yet

    on_arm do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-aarch64-apple-darwin"
      sha256 "f0fedbf3adaea4155e96315fb0277955fdc2fcdd5aa9e63dbed15f770a171f6a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/fjord-cli-x86_64-unknown-linux-gnu"
      sha256 "7d9cece1a525a3bcb75acc1bc6b4b0ab842e52d4f7d87e085333e90b3450c7b9"
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
