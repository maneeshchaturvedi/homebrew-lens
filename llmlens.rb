class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.46/lens-darwin-arm64"
      sha256 "7d88ddb9d5f054b94a5e94952bfcb9e90630f7f0199d40865ace7fabf25364ac"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.46/lens-darwin-amd64"
      sha256 "6da611239fe7b2ad6a5cce5922e860ec360190a5b427048f85e00d52d1fa7b77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.46/lens-linux-arm64"
      sha256 "b46340abfda4c1a05d222ba0ed2f4f34f12da138cb50d82c2fe226038863a711"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.46/lens-linux-amd64"
      sha256 "833c664250393e959a8be55a08362b29bff7d81f8dcd48ef9e185f20e0df4706"
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
