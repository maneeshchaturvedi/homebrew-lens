class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.61/lens-darwin-arm64"
      sha256 "b34c2e5d0f0f5d4991a80a7492905ce3076ce4acaf6e7e0d12114858b9efde79"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.61/lens-darwin-amd64"
      sha256 "93f6de68b52b639fbdd81943ea015793d1700cc5895d500dd2dc4f23e35dd521"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.61/lens-linux-arm64"
      sha256 "3a42f8c48f47753705f0d591f8e39e74cdd99db33c806c6374a1ad89039d21c3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.61/lens-linux-amd64"
      sha256 "f1e1c48deb4937df04394b1b2421fd12fb872ab93b64881c1e51015631be1769"
    end
  end

  def install
    bin.install "lens-darwin-arm64" => "lens" if Hardware::CPU.arm? && OS.mac?
    bin.install "lens-darwin-amd64" => "lens" if Hardware::CPU.intel? && OS.mac?
    bin.install "lens-linux-arm64" => "lens" if Hardware::CPU.arm? && OS.linux?
    bin.install "lens-linux-amd64" => "lens" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "lens", shell_output("#{bin}/lens --version")
  end
end
