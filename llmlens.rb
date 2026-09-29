class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.33/lens-darwin-arm64"
      sha256 "d493e0b837a064659062228564e07a210c3d0af0082819bffab749aab86ecbf4"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.33/lens-darwin-amd64"
      sha256 "6057e423f4608fc9c323ee1dd1c66a880dce5690d238c72465194064e3c4b6cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.33/lens-linux-arm64"
      sha256 "de7ee9c1a2d4756240e01bb71ddfb601fdc850df363b77f09a63c708ce0eacdc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.33/lens-linux-amd64"
      sha256 "7ed4cd9c27d778f9bf04d7f913408513bada5cbe105b12ed75f28c0d1a0d61d4"
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
