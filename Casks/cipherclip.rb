cask "cipherclip" do
  version "1.0.18"
  sha256 "ae30c29dd7b7ff459366035a9dc1bd218c6500b35edf350e914f212776087829"

  url "https://github.com/jakemerson/homebrew-tap/releases/download/v#{version}/CipherClip-#{version}-mac.zip"
  name "CipherClip"
  desc "Gerenciador de área de transferência criptografado (AES-256) com anti-senhas e Touch ID"
  homepage "https://jakemerson.github.io/desafio-12x12/cipherclip/"

  depends_on arch: :arm64
  depends_on macos: :ventura

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
