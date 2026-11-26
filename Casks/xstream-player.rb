cask "xstream-player" do
  version "2.1.0"
  sha256 "3a0b93ef03c79c887449f16129727706991f943b75a3cec4737d7cf4f12284b4"

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
