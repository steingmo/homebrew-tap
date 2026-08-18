cask "kvf-player" do
  version "1.1.4"
  sha256 "b8e5d31a3a6bb470445d171aa615507a2f02717eff576560a52ecce389d08df7"

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
