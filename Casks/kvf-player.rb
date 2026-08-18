cask "kvf-player" do
  version "1.1.2"
  sha256 "2c3dd62f78e0c6b8d6ca16837f4c15bdb837407fd257dd6e575c8e57857e8932"

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
