class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.29/lens-darwin-arm64"
      sha256 "a6b518529b05d746c7570fdd3387fddc463046db35a822883e8816d6e0ddbc3b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.29/lens-darwin-amd64"
      sha256 "e95577cea8b248304b336ee4c0bc8dc857b4acd84e6c43640673c17751025c0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.29/lens-linux-arm64"
      sha256 "96d0aeeff1952a232d1d035b185844c45ff82b13da0ece97c54fb11a9523aac1"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.29/lens-linux-amd64"
      sha256 "2cea6f0f3f66ddeccd28edb4ec158116e5139be1c4e125b089d1989d663a4f61"
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
