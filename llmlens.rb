class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.18/lens-darwin-arm64"
      sha256 "077b798b30705debfa402f7da045dd1d247159b274f61dbf0b48597808edbd1a"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.18/lens-darwin-amd64"
      sha256 "8c2e41215615c81d10cf8b333de7e5a6a1019e12c9450d268ad9420440e0c972"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.18/lens-linux-arm64"
      sha256 "67d5a50e940d3abbc0d9c39d97c07541af7bdfcb5c06a821b0231f207ecf7674"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.18/lens-linux-amd64"
      sha256 "432d69c4277080077940ef2406ef0ef3ffdb1e123141ff65fc76ac60054441c4"
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
