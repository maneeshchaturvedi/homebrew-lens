class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.2/lens-darwin-arm64"
      sha256 "8d99332ff76f81c64d45bdf569e8b0cc117e4354d02187a45a58e9e1697b9ffa"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.2/lens-darwin-amd64"
      sha256 "837ce270faf521d35d0a61d3641e75fefbcfab0e74ff0fa85dfc7915ad90eca1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.2/lens-linux-arm64"
      sha256 "32d3722822ea3a9a77037e4b01b3bae4b1e6f0dc6ace69b3b87cfae850c711cc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.2/lens-linux-amd64"
      sha256 "4c8cb4c7b2d2fc56e0697b54421bf4b25cd62d65ed672a634eb2e384b5960a41"
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
