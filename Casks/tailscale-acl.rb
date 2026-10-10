cask "tailscale-acl" do
  version "1.27.0"
  sha256 "e1fcc5f62f4b4007b148ee0e453b71eea440b1d3fbdee8a202232da9cbd58bcb"

  url "https://github.com/steingmo/tailscale-acl-manager/releases/download/v#{version}/TailscaleACL-#{version}.zip"
  name "Tailscale ACL"
  desc "Edit, visualize, simulate, and test Tailscale ACL policies offline"
  homepage "https://github.com/steingmo/tailscale-acl-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Tailscale ACL.app"
  binary "#{appdir}/Tailscale ACL.app/Contents/MacOS/TailscaleACL", target: "tailscale-acl"
end
