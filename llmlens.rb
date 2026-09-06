class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.5/lens-darwin-arm64"
      sha256 "fd4a4da06bc328357b8606ae41df37082e2143199af445664483067acc6ae89a"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.5/lens-darwin-amd64"
      sha256 "489d49d95d90226f70345878ad90b5f66a2c4353cf2454bb14fee11d8e383682"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.5/lens-linux-arm64"
      sha256 "0e2930c466496067f38db38033c1170674ebcfe2b759419df4ab9aee0d67cde4"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.5/lens-linux-amd64"
      sha256 "673c11e1641a4defa03f84255998bdab7e57d3b7e23dd0fe50670977f15bbc40"
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
