cask "qucs-s@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "24.2.1"
  sha256 :no_check

  url "https://github.com/ra3xdh/qucs_s/releases/download/continuous_build/Qucs-S-#{version}-macOS-#{arch}.dmg",
      verified: "github.com/ra3xdh/qucs_s/"
  name "Qucs-S"
  desc "Quite Universal Circuit Simulator with SPICE"
  homepage "https://ra3xdh.github.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "ngspice"

  app "qucs-s.app", target: "Qucs-S.app"

  zap trash: [
    "$HOME/Library/Application Support/qucs-s",
    "$HOME/Library/Preferences/com.example.qucs-s.plist",
    "$HOME/Library/Saved Application State/com.example.qucs-s.savedState",
  ]
end
