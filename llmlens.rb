class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.17/lens-darwin-arm64"
      sha256 "b7aa976c34cd1477b4596938fbc15834d1e24e772d510f3b06b1c9844cef923a"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.17/lens-darwin-amd64"
      sha256 "9fd9299ea77ef952b4e96e1f6f5841a92048412c36fcedbc902b2f38b1e7db92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.17/lens-linux-arm64"
      sha256 "b167ad0db914e7ca26c6fdfd01b3dd035c9280cc8d0843ea93982b2b9ae12d5b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.17/lens-linux-amd64"
      sha256 "47c121d31270ac8eb3d1ca9175e23392586174f7e4931ec087b2fc6ca32e41c6"
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
