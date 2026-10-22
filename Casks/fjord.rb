cask "fjord" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.30"
  sha256 arm:   "11db869971625ac3ed8c20fe92f26b08d5686938bb339983e65d1ffba58b3a19",
         intel: "341a71fbff94bea8c0064743e77aeece3bcc67ed5454561623f2087bdc444969"

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
