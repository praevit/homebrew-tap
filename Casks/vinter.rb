# Homebrew cask for Vinter, published to praevit/homebrew-tap by
# .github/workflows/homebrew.yml on every release, which fills in the
# version and the dmg checksum.
cask "vinter" do
  version "0.1.12"
  sha256 "09c719b498e15765809dc37c52cbd1ece2a30c758f4c9c9e7e318bbaf8eacd1a"

  url "https://github.com/praevit/vinter/releases/download/v#{version}/Vinter_aarch64.dmg"
  name "Vinter"
  desc "Run Windows apps with Wine"
  homepage "https://getvinter.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Vinter updates itself from its menu.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Vinter.app"

  zap trash: [
    "~/Applications/Vinter",
    "~/Library/Application Support/Vinter",
    "~/Library/Caches/com.praevit.vinter",
    "~/Library/LaunchAgents/Vinter.plist",
    "~/Library/Preferences/com.praevit.vinter.plist",
    "~/Library/WebKit/com.praevit.vinter",
  ]
end
