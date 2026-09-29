class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.27/lens-darwin-arm64"
      sha256 "c4255debef8844f3a8cdf9a9eb26c703f3413ed8dfc7dbc53d6e1b04a388a8cc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.27/lens-darwin-amd64"
      sha256 "99b746ae67801d63e807c2afc5a61dbd9e37ea0304587a88ab30b9c2bc303613"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.27/lens-linux-arm64"
      sha256 "b003371446155b13423098373d39464e04cafbd4735ea72b07e4d2d0c20743cc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.27/lens-linux-amd64"
      sha256 "423348f752e4355b04ace8ac7c2d8943d8059c2cccb1b3671aa533b911bf68b8"
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
