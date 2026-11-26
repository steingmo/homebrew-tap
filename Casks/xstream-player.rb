cask "xstream-player" do
  version "2.0.1"
  sha256 "e446abc36ae1718bfed0ff631330a5686acae01e6f0fa7988b7244e9889861c4"

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
