cask "keytype" do
  version "1.2.0"
  sha256 "c5e3c38ba6cc014982f7cacb2e7feb909f66efd9e284943493c962f9647807be"

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
