cask "keytype" do
  version "1.3.0"
  sha256 "7710bf51f164aa1cf7638c2bb4ae9d13a4a1ca4f34ccf47b44ebb6b756c7dd69"

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
