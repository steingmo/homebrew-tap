cask "tailscale-acl" do
  version "1.29.0"
  sha256 "4c6440cc07a8c0b0f801df5271075ef8e734248db360076f66b41745cc470993"

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
