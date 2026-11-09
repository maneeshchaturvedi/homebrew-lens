class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.60/lens-darwin-arm64"
      sha256 "7b181a7b8746a25a0f12fc6af5b1d4ededd5ee7cc574081b5d0c4128d2764545"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.60/lens-darwin-amd64"
      sha256 "1478bc0dcd3cd9573839ce3644f1fb5c4998619e57b8fbe8671287a9237019ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.60/lens-linux-arm64"
      sha256 "746d37c6d300813c23fb9b15e49e30f8bb8ffbb9541b97f06708dc93a1705919"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.60/lens-linux-amd64"
      sha256 "b483afb730d70fd355872414644dbb62419c8a023fdd79ba599f814fd9437842"
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
