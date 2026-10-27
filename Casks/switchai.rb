cask "switchai" do
  version "1.0.0"
  sha256 "8af67c6ff53937dcfa97eca88b96e5c4d2952ac5f94fd65f2c4c15e488ca7ec7"

  url "https://github.com/jakemerson/homebrew-tap/releases/download/v#{version}/SwitchAI-#{version}-mac.zip"
  name "SwitchAI"
  desc "Multi-Profile AI Desktop & Quota Hub para Claude, Antigravity, Cursor e ChatGPT"
  homepage "https://jakemerson.github.io/desafio-12x12/switchai/"

  app "SwitchAI.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/SwitchAI.app"]
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/SwitchAI.app"]
  end

  zap trash: [
    "~/.switchai",
    "~/Library/Application Support/switchai",
    "~/Library/Preferences/com.jakemerson.switchai.plist",
    "~/Library/Saved Application State/com.jakemerson.switchai.savedState",
  ]
end
