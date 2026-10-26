# 🍺 Homebrew Cask Tap para o CipherClip

O Homebrew Cask é a melhor maneira de distribuir aplicativos macOS de forma independente, pois o `brew` remove automaticamente a flag de quarentena do macOS (`com.apple.quarantine`), **eliminando completamente a tela de "App não verificado" ou "App danificado"** mesmo sem pagar os US$ 99/ano da Apple!

---

## 🚀 Como Publicar seu Próprio Tap no GitHub (2 minutos)

1. **Crie um repositório no seu GitHub chamado:**
   ```
   homebrew-tap
   ```
   *(A convenção do Homebrew exige o prefixo `homebrew-` para que o comando `brew install jakemerson/tap/nome` funcione direto).*

2. **Copie a pasta `Casks/` para a raiz desse repositório:**
   ```
   homebrew-tap/
   └── Casks/
       └── cipherclip.rb
   ```

3. **Após compilar a Release v1.0.0 com `CipherClip-1.0.0-mac.zip`:**
   Obtenha o hash SHA-256 do arquivo zip:
   ```bash
   shasum -a 256 release/CipherClip-1.0.0-mac.zip
   ```
   Substitua o `:no_check` em `cipherclip.rb` pelo hash retornado:
   ```ruby
   sha256 "HASH_SHA256_AQUI"
   ```

4. **Pronto! Qualquer pessoa no mundo pode instalar rodando:**
   ```bash
   brew install --cask jakemerson/tap/cipherclip
   ```
   *(Sem avisos de segurança, sem erros do Gatekeeper, direto para a pasta `/Applications`).*
