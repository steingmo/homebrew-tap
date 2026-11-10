cask "tailscale-acl" do
  version "1.33.0"
  sha256 "947eb96f044c81d5d66af0e19caf04ebcd53837f43980e885e112b9e839678f4"

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
