cask "xstream-player" do
  version "2.6.0"
  sha256 "4898fbdff7d96f99d87c94942b4535b3418b440f9007817cd6cc94c2730e111a"

  url "https://github.com/steingmo/xstream-player/releases/download/v#{version}/Xstream.zip"
  name "Xstream"
  desc "Xtream Codes IPTV and M3U player, playing in VLC, Infuse, or the native player"
  homepage "https://github.com/steingmo/xstream-player"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Xstream.app"

  zap trash: [
    "~/Library/Application Support/Xstream",
    "~/Library/Preferences/com.steingrimosa.xstream.plist",
  ]
end
