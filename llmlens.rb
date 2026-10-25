class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.56/lens-darwin-arm64"
      sha256 "b7d59f44e152b02f05cd4467e849e7d5c35cd392e1e0948d45dd9dcca8c27837"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.56/lens-darwin-amd64"
      sha256 "47a132a846cbe2ec9cf1985239952ec728e92f13967600e8a3f9dc7918d2b171"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.56/lens-linux-arm64"
      sha256 "f62379baf3e77186c9fb8926dcaf70b87313d53f819865b5c28f4ab18cc43465"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.56/lens-linux-amd64"
      sha256 "467ea4f4a0947e0c79e8731d4331579654191f66d19696ff34e08d2e60cb1eca"
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
