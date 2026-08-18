cask "kvf-player" do
  version "1.1.0"
  sha256 "0ad0b1a75ddf296c8c7311b12de788cdb61e124a294039965d7e1c3ec7b6a4d1"

  url "https://github.com/steingmo/kvf-player/releases/download/v#{version}/KVF.zip"
  name "KVF"
  desc "Live TV and radio, on-demand catalogue, and programme guide from Kringvarp Føroya"
  homepage "https://github.com/steingmo/kvf-player"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "KVF.app"

  zap trash: [
    "~/Library/Preferences/com.steingrimosa.kvf.plist",
  ]
end
