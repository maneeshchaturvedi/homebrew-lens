class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.47/lens-darwin-arm64"
      sha256 "81af2f74bcea2ad0a63b15f5a9e5d5bfdd5880de0eafd07270dac4e7fa2ee71f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.47/lens-darwin-amd64"
      sha256 "0514456ed779212749c75f859cb27222b7cacc6530af37a662614aecff181134"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.47/lens-linux-arm64"
      sha256 "a02cd89da3ca6eea77e2f9354ec7b4bcd3f95203ec1ef95a0d69b52733755cdb"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.47/lens-linux-amd64"
      sha256 "70dab656a50700284446ebb4e26beed76e9b38faf2884c2c58d753db2cf381b3"
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
