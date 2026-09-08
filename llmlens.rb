class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.6/lens-darwin-arm64"
      sha256 "b29d1421af50b2d702a1f1c83fc6e0442f3deac67077ab4fea5de2867f7b4b23"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.6/lens-darwin-amd64"
      sha256 "ef8833eea4f9f152c0ddce00ffb5722a01063e0113e0f8bb9cc8169af700739e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.6/lens-linux-arm64"
      sha256 "54fb0b5c25b3b5b45fa706a02b82414b0c98d5c5987052dfc6b9795a278a1c26"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.6/lens-linux-amd64"
      sha256 "c4c322a090f9dca92324cff90fc510db660d98e756d7e96bc76c35cddca402f9"
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
