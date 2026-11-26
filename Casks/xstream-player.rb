cask "xstream-player" do
  version "2.3.0"
  sha256 "d9c842330a83109f40bd7ffe2c0fcdd79004beea241f5400a2583b2fbc04efaa"

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
