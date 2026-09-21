class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.15/lens-darwin-arm64"
      sha256 "4c1cd43a049ab9c91119015e01f1bdd8e53984705342147e95b3459ce32411c3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.15/lens-darwin-amd64"
      sha256 "7aeb8602d5d2cf1b29e59be53798ee7a488bb55d88fe4c0889bc398cdc24501c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.15/lens-linux-arm64"
      sha256 "f7957604f34234279c3d4e9cbdcf8cd7133cfc0ace00f14ccf97e2193efcd412"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.15/lens-linux-amd64"
      sha256 "e5b02f0e5edc453d8042c8d8aa31189c77e24b0045b82497f28b9d2b326d733e"
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
