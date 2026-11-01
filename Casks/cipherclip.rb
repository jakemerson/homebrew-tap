cask "cipherclip" do
  version "1.0.12"
  sha256 "f02345ef3486c1f9dc25f0152cfe7a3d6e7e204a2bc7a56a85b366237d61b99c"

  url "https://github.com/jakemerson/homebrew-tap/releases/download/v#{version}/CipherClip-#{version}-mac.zip"
  name "CipherClip"
  desc "Gerenciador de área de transferência criptografado (AES-256) com anti-senhas e Touch ID"
  homepage "https://jakemerson.github.io/desafio-12x12/cipherclip/"

  depends_on arch: :arm64

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
