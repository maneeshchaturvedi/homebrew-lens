class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.43/lens-darwin-arm64"
      sha256 "c1b0cd40134373d1528abce3f1c4040c8a0c0480a03b04ef1c8609ae810171db"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.43/lens-darwin-amd64"
      sha256 "834629088a131be19fec761399f438b19daa7175596de7d803e7bc5318407573"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.43/lens-linux-arm64"
      sha256 "2ff29f747fbee5fe7b509a45ed7c6b933e269e8ba6cfc14ee13f19b64740b7f8"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.43/lens-linux-amd64"
      sha256 "b34ea4a8db520357fdbff68e324ef04064291d8b7322e83ff113c4f5b4460b8f"
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
