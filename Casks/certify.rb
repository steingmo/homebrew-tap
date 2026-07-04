cask "certify" do
  version "1.1.0"
  sha256 "1dd60f13c60451fd1d5002f9f7017c515c0678aa9dd505e995822c56d0c7850e"

  url "https://github.com/steingmo/certify/releases/download/v#{version}/Certify.zip"
  name "Certify"
  desc "Let's Encrypt certificates with DNS-01 validation, PEM + PFX export"
  homepage "https://github.com/steingmo/certify"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Certify.app"

  zap trash: [
    "~/Library/Application Support/Certify",
    "~/Library/Preferences/com.steingrimosa.certify.plist",
  ]
end
