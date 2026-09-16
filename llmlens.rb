class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.11/lens-darwin-arm64"
      sha256 "06c731ad7cbbee0329030e59f049d6e2a2e775356f54851c2d334fd6b175adf3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.11/lens-darwin-amd64"
      sha256 "39214272d10b3fbdf7ecf40f56fefc829a63cdf16029de754e83c14296d494b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.11/lens-linux-arm64"
      sha256 "a389d66798d53a65c7300f00799192e94369e4be1f9de2ef67386aae567bb3a5"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.11/lens-linux-amd64"
      sha256 "1a77fad1ec985fa61b35b08cbf9ab8c24e8f7d0e71d27e1f5b535f04dfd5a470"
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
