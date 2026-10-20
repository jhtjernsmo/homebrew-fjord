cask "fjord" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.28"
  sha256 arm:   "23cbce431d03cabc7419ec39e121f3a3b03a0a71200d6a2acd6b09463cad80d7",
         intel: "fd03efe4362762773606c0d10a34006cfc89b92ff9d9605910e09336e59f5bc8"

  url "https://github.com/jhtjernsmo/fjord/releases/download/v#{version}/Fjord_#{version}_#{arch}.dmg",
      verified: "github.com/jhtjernsmo/fjord/"
  name "Fjord"
  desc "Local-first, keyboard-first project manager with Git integration"
  homepage "https://jhtjernsmo.github.io/fjord/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Fjord.app"

  zap trash: [
    "~/Library/Application Support/fjord",
    "~/Library/Application Support/no.tjernsmo.fjord",
    "~/Library/Caches/no.tjernsmo.fjord",
    "~/Library/Preferences/no.tjernsmo.fjord.plist",
    "~/Library/Saved Application State/no.tjernsmo.fjord.savedState",
    "~/Library/WebKit/no.tjernsmo.fjord",
  ]
end
