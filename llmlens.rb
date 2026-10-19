class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.51/lens-darwin-arm64"
      sha256 "dc2f581c53381ddc8682d06c2b8b55c60be16d75b563cfeb65f902ba9fc54e1f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.51/lens-darwin-amd64"
      sha256 "8cc8c81e3e0337d33a3c66ff875304d4450c2d14ab38de8a93878b866b082fb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.51/lens-linux-arm64"
      sha256 "5b5854218552577c43edf2a90e9de961875ed33e422b862c4af73720d0e3b82f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.51/lens-linux-amd64"
      sha256 "355e00becaf3eb4b3fdcba01efefacc3260f928cc246f8371e6745254e5529ad"
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
