cask "onedrive-watchdog" do
  version "1.0.1"
  sha256 "6b8c9975d5d5d9a2934c7e1a51560ce1f8936b1347f301417f9770c02711d6da"

  url "https://github.com/steingmo/onedrive-watchdog/releases/download/v#{version}/OneDrive-Watchdog-#{version}.zip"
  name "OneDrive Watchdog"
  desc "Restarts OneDrive automatically if it stops running"
  homepage "https://github.com/steingmo/onedrive-watchdog"

  app "OneDrive Watchdog.app"

  # Turn the watchdog on right away; no need to open the app.
  postflight do
    system_command "/bin/sh",
                   args: ["#{appdir}/OneDrive Watchdog.app/Contents/Resources/install-onedrive-watchdog.sh"]
  end

  uninstall script: {
    executable:   "/bin/sh",
    args:         ["#{appdir}/OneDrive Watchdog.app/Contents/Resources/install-onedrive-watchdog.sh", "uninstall"],
    must_succeed: false,
  }
end
