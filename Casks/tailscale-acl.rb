cask "tailscale-acl" do
  version "1.9.0"
  sha256 "632ca47a02e50800cdd4bfed945b81e50fb54b029f1f9ac26a4e440a4f199c1d"

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
end
