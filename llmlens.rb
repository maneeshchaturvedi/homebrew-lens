class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.24/lens-darwin-arm64"
      sha256 "5bc41bc741fb5efe81390f6a0a53dd674578ed814935e41095148a9283072765"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.24/lens-darwin-amd64"
      sha256 "7f7e21ae45dae747970f0370bd8b604a1c179479ab6c315b64c465557c2c9548"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.24/lens-linux-arm64"
      sha256 "e40ecfd5a5785972eeec1cf419fd838668f9289e5cce79f999b47b3c592101c0"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.24/lens-linux-amd64"
      sha256 "9995715a5dd217172f3f9183583ed052d52c4172c2587c8df76a489496f08cb2"
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
