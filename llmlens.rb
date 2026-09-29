class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.32/lens-darwin-arm64"
      sha256 "a1f643e4dcf83faa77ee191c8b4b5a49723ccec66209323803a2cab3df48a9d2"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.32/lens-darwin-amd64"
      sha256 "f53d86916fbb8bef67840c7b49bec47e7e92973fce8c752c998e75bc82f04860"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.32/lens-linux-arm64"
      sha256 "4d92edfb6454e367602d36ffbc964cde0adf9184890d3c20e5355d5eaebce24e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.32/lens-linux-amd64"
      sha256 "14df2afc42cdf8990d44c6872f1dcfed8b1f7a5f1d099e5eaa5ec98e31957282"
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
