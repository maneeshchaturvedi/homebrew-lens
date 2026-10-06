class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.45/lens-darwin-arm64"
      sha256 "a88b8308c6b7e4950921935f881fdcaa89fbb4c98c55c68c0322d8162d89e2d7"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.45/lens-darwin-amd64"
      sha256 "ada70ad9f203f4664cc647b99d07351189aed4015541232451a5ed0181361441"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.45/lens-linux-arm64"
      sha256 "1df5d08fdc06f3bcf6bd1cda626005a5bc2c6a9dbd53723b906d1042e8cacb31"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.45/lens-linux-amd64"
      sha256 "1d75a8227c89282f7a29754494b7eddeaf1a15a5c7af42883789fd935a10c2d6"
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
