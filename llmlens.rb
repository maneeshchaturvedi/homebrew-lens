class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.25/lens-darwin-arm64"
      sha256 "f76c4f3930bb131a2c475cce8eba22719042521fd6d0111f4ebb6f267e2b2dc2"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.25/lens-darwin-amd64"
      sha256 "b1c197768e46bc50fd4b458a48fbf89ddb1492ed3d7ac4c345445ab99c8b7459"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.25/lens-linux-arm64"
      sha256 "dcf243d05c0aaaf076569b458d4a548d4eaa57b7f3af094497a7076fb4f9e972"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.25/lens-linux-amd64"
      sha256 "37356c6996bc451849cd9169457253120882c851bf71cc0e885651451b1e657a"
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
