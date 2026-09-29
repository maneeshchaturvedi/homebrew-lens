class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.37/lens-darwin-arm64"
      sha256 "ef4771eaa70e79abe85ec6fa179708fe060196a6724137ba33257f88acbd76b7"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.37/lens-darwin-amd64"
      sha256 "1df2b81d8aa26e9a2efab4604f5335b19ffdbc189c477697aed2084c01d054da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.37/lens-linux-arm64"
      sha256 "76435ff74003716700619631f6d545228ef37f16bd0792ea309fbccdb7450c23"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.37/lens-linux-amd64"
      sha256 "3e0539dd36d7bf6709da0db5f622a5d620a31655e58e74d5221f05f5e58debc6"
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
