cask "tailscale-acl" do
  version "1.31.1"
  sha256 "5acfe18de3ffbec2b6270c139de14e732fb63f5c2ac55816c4df9b4c4d902a6d"

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
