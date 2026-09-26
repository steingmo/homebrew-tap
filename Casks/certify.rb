cask "certify" do
  version "1.2.0"
  sha256 "d563dfa9bd48e73efc4e06e0a183e4e0b9cc80a1c0ab465a08eced7d0229f752"

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
