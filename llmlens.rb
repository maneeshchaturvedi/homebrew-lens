class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.34/lens-darwin-arm64"
      sha256 "f75067b786f119f260220b7a82c499ef9563cada1c89637a545b82bc467eceaa"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.34/lens-darwin-amd64"
      sha256 "a4d66bd6942846ede0e3fa80c5c35a0ba123b98287948ba5f31aaaed42b62c20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.34/lens-linux-arm64"
      sha256 "866326d349d28e1af00f0938e985fe516f78ce62d7482f4cb0aaf23b775f618c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.34/lens-linux-amd64"
      sha256 "e47a0d245afc68f0acd4883ee7a20663ef9b53dec0b0e8199045eec9bf1d3577"
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
