class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.58/lens-darwin-arm64"
      sha256 "1aeb3913b8641476d1a468b3285d7a55dcd2947ec2ef8d6cf9b6ff1b1ab0ab01"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.58/lens-darwin-amd64"
      sha256 "b0ffe02de47cbbcf03343f29d17b1244851d9b28d321ea4da85437cd0af98bf8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.58/lens-linux-arm64"
      sha256 "072cf572995354af534003867525d25595ff79815e821f80748a04a241c41471"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.58/lens-linux-amd64"
      sha256 "5ac63921ebb7804c704d87846e32b7539c47c1a41277f20df2c9805b34d13dd4"
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
