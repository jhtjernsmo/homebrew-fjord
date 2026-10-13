cask "fjord" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.25"
  sha256 arm:   "8a5352ebe03dc4dcc7022bc998e6f906068742aa9c0ceaa98f10c86b65fb2a44",
         intel: "11b7bdc36781d7edab4ba39db3bb093acde84b8540f15e52381f5b4480f29d57"

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
