cask "tailscale-acl" do
  version "1.31.3"
  sha256 "d907fe62e62d579d63be83a310c1339d417afe08b56169d1bb711bfeae30f3da"

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
