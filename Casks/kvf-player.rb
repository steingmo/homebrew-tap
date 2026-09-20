cask "kvf-player" do
  version "1.3.3"
  sha256 "c8ca184e577a38bedc4f03dd976e6fc4714f4eff193fe1293a0d9285dc594294"

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
