cask "keytype" do
  version "1.4.0"
  sha256 "74836ba33b6fb5a56c6c4eb91595b7d11f3cb223f451509d621a891e860f260d"

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
