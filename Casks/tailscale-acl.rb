cask "tailscale-acl" do
  version "1.0.0"
  sha256 "d93d9cd1d882743744bb3cf5e5e0a819fb1e35f1817067f526cc179dfd2f7e57"

  url "https://github.com/steingmo/tailscale-acl-manager/releases/download/v#{version}/TailscaleACL-#{version.major_minor}.zip"
  name "Tailscale ACL"
  desc "Edit, visualize, simulate, and test Tailscale ACL policies offline"
  homepage "https://github.com/steingmo/tailscale-acl-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Tailscale ACL.app"
end
