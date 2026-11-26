cask "xstream-player" do
  version "2.0.0"
  sha256 "5faa31fe0344ada51fe9705a2a2973de49f1755e9eff482b6a200db39d7e9d2d"

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
