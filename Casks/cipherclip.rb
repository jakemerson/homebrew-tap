cask "cipherclip" do
  version "1.0.5"
  sha256 "036fcdfb106c6e69065499136420a1f6c02dbf643f22187cfbcd72cf2c0affc9"

  url "https://github.com/jakemerson/homebrew-tap/releases/download/v#{version}/CipherClip-#{version}-mac.zip"
  name "CipherClip"
  desc "Gerenciador de área de transferência criptografado (AES-256) com anti-senhas e Touch ID"
  homepage "https://jakemerson.github.io/desafio-12x12/cipherclip/"

  app "CipherClip.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CipherClip.app"]
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/CipherClip.app"]
  end

  zap trash: [
    "~/.cipherclip",
    "~/Library/Application Support/CipherClip",
    "~/Library/Preferences/com.cipherclip.app.plist",
    "~/Library/Saved Application State/com.cipherclip.app.savedState",
  ]
end
