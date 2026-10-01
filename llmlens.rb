class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.41/lens-darwin-arm64"
      sha256 "5d138618c37270eec833184adcfd6e132e6a970e2d3f00f2020fd07ab40a251e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.41/lens-darwin-amd64"
      sha256 "1b8b369caa1088f234457fd8ed774bb0a0e2afa053765f3c8bd9065cbf3e2781"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.41/lens-linux-arm64"
      sha256 "b85bc227c17534472cbaa49cefa4347ed771074349b5a457d7c2590acb6c928a"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.41/lens-linux-amd64"
      sha256 "c4efa03f2efc08e1c2279383a5f9208b0d206a67738ac6f553bf1a28d0b4fc11"
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
