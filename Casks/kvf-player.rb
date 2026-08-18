cask "kvf-player" do
  version "1.1.1"
  sha256 "bd274796d7d06fd03581daab98d6226dd3298b65d7fe78da75bcfcf4ced5a18d"

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
