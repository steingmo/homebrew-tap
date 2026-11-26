cask "onedrive-watchdog" do
  version "1.0.0"
  sha256 "9ac540eaee354d0b94c5d6c27f24497b1ac702369c213b6e7c8b710c6cd8c591"

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
