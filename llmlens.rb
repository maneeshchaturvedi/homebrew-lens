class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.7/lens-darwin-arm64"
      sha256 "cdf24dca9c8f5edc0896609a45df60616a7ef2172bb7a63819075784128c330c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.7/lens-darwin-amd64"
      sha256 "82fa32b557fec924cdc4c451e4965b0e2d582a5e2a4ac5fe9a516e9fa5eef2e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.7/lens-linux-arm64"
      sha256 "c45837726bd4f0743056c6d65de0144ee8b3f3abe184871e5ec6c9075343a909"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.7/lens-linux-amd64"
      sha256 "944ef7d803ffc829817af147a6a36e13e35a6a6da43de5eebde9555194464767"
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
