cask "cipherclip" do
  version "1.0.0"
  sha256 :no_check # Atualizado com o sha256 do CipherClip-1.0.0-mac.zip

  url "https://github.com/jakemerson/cipherclip/releases/download/v#{version}/CipherClip-#{version}-mac.zip"
  name "CipherClip"
  desc "Gerenciador de área de transferência criptografado (AES-256) com anti-senhas e Touch ID"
  homepage "https://github.com/jakemerson/cipherclip"

  app "CipherClip.app"

  zap trash: [
    "~/.cipherclip",
    "~/Library/Application Support/CipherClip",
    "~/Library/Preferences/com.cipherclip.app.plist",
    "~/Library/Saved Application State/com.cipherclip.app.savedState",
  ]
end
