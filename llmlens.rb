class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.28/lens-darwin-arm64"
      sha256 "6c98132b2d29d696557c21461790ba24cbecc9890fe7a066359b63ffa4ccd7a7"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.28/lens-darwin-amd64"
      sha256 "fc0699f3b235fce151859684adc4e85902b7aea86ef9bb31528a97b5b84d27ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.28/lens-linux-arm64"
      sha256 "37f8a0f9811aa1d746f55fbace61f6e1cc1f3f91f53837220b769d00ddaffc4f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.28/lens-linux-amd64"
      sha256 "300a385588d2e0552682fbd04fec3d9534b1d12e37ade24595652d654b80242d"
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
