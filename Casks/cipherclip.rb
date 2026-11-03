cask "cipherclip" do
  version "1.0.15"
  sha256 "b9e0887db12a4edcd77eafd9b57178d596275e907730d21c66bbd11f4629d353"

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
