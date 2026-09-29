class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.31/lens-darwin-arm64"
      sha256 "8103254d65920ffa29b4afac91cc8be03c97d4d161a61d659c9214d2a130d30e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.31/lens-darwin-amd64"
      sha256 "f2e4ed9b69d8f24d202c51d61c3de704587bc0564ed1cb0000bbf3f150af9a5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.31/lens-linux-arm64"
      sha256 "84ed5f075079721354b27bd29ce98cd8d6a31cc3abac62076f61a750746f454d"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.31/lens-linux-amd64"
      sha256 "d38250e6c461f931277cc5020b5045c538a0cced3beca092327db60d093d25ac"
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
