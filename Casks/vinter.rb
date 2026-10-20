# Homebrew cask for Vinter, published to praevit/homebrew-tap by
# .github/workflows/homebrew.yml on every release, which fills in the
# version and the dmg checksum.
cask "vinter" do
  version "0.1.8"
  sha256 "0198c33331131f17ee807c2b6c3aea7bcab36dc27d0c5e77401fe20fcdec4a6d"

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
