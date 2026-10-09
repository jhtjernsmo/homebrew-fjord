cask "fjord" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.15"
  sha256 arm:   "a44dd9bc08a7f475720b34c9e65b1b2a0435c182a5f302e131e1bd49e8977f62",
         intel: "af9a7fac863937a250db194890e684cd5fd318d2419fd6df48313984b6e46bfa"

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
