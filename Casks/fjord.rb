cask "fjord" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.14"
  sha256 arm:   "cd9eb4489c0f1dd4980677fe6c698a04f12b9cdb693105845aa211a9f6fc2ca2",
         intel: "9f0d7da76ec7c62f73bc3ee8a1e5a3b75d5d67ebbd69f800fbd826d85efacf5b"

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
