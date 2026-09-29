cask "keytype" do
  version "1.4.1"
  sha256 "f36fbfffa0cef8e90d8db7eeadcee1be9034d2f0fc03487744ea527926b8879f"

  url "https://github.com/steingmo/keytype/releases/download/v#{version}/KeyType.zip"
  name "KeyType"
  desc "Paste as keystrokes — types your text where ⌘V is blocked"
  homepage "https://github.com/steingmo/keytype"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "KeyType.app"

  zap trash: [
    "~/Library/Preferences/com.steingrimosa.keytype.plist",
  ]

  caveats <<~EOS
    KeyType needs Accessibility permission to send keystrokes.
    Grant it on first launch in System Settings -> Privacy & Security -> Accessibility.
  EOS
end
