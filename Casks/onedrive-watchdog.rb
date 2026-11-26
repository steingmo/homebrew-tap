cask "onedrive-watchdog" do
  version "1.0.2"
  sha256 "57971d1628ab74fc23f4717e4c77ed5c63c75d581bf50930723b5b115f33dfa6"

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
