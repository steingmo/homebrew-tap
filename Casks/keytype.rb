cask "keytype" do
  version "1.2.2"
  sha256 "44e59d9872d1fe75998d740f0892438e0200c44db268311bcdf9cf9f54091e1f"

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
