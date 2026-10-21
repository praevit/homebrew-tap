# Homebrew cask for Vinter, published to praevit/homebrew-tap by
# .github/workflows/homebrew.yml on every release, which fills in the
# version and the dmg checksum.
cask "vinter" do
  version "0.1.10"
  sha256 "b538d3d35d91e34f991479569f76ad00381c09ac131c75adb899096c95a6d178"

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
