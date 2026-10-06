class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.49/lens-darwin-arm64"
      sha256 "d60b65ad2bd53967f50274c550e391a6163761fd515e06855ef9490b6ae0fbde"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.49/lens-darwin-amd64"
      sha256 "e50fe525629d1dd6f24d5e874f8d790d4d7017660905d1bbe36602d703eff214"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.49/lens-linux-arm64"
      sha256 "81a4b7e652238b7cf7c2c73f29f380d51019d86946eea6da68097ef304a7535c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.49/lens-linux-amd64"
      sha256 "22dbe2cde69a713b3cc6475023131264f4e5c7a8da2c8405b1f457bc77aacfcb"
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
