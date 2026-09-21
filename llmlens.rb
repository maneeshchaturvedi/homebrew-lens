class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.16/lens-darwin-arm64"
      sha256 "59195b498b6a45cb8b428c48e0071711cf7529c94e67194a9652e345fc11a562"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.16/lens-darwin-amd64"
      sha256 "1218f64144d85f76e19d70d0c69eed57cdc4d898bed52839d9b78dda1506cd8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.16/lens-linux-arm64"
      sha256 "cb6b0a28b1c03f8d7522d2231d67eab983053d747edc9380492757839b67c05e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.16/lens-linux-amd64"
      sha256 "5825c2a84b9996e4969096ebdaf6b256b71fc160a2322edffd515fe0e4e4dd92"
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
