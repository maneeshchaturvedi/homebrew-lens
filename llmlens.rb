class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.23/lens-darwin-arm64"
      sha256 "21b2fedd7fb796f03956ca9852d28af31bb83c21ea7541029c467d972c984ed6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.23/lens-darwin-amd64"
      sha256 "e2b26e929cc42337907a4832ad407de5ae68ea930922fd1045eba39ac8063d15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.23/lens-linux-arm64"
      sha256 "5a72730876c8627811bc67d11b83be994c71460d2bc373bf5b858ce2d736268d"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.23/lens-linux-amd64"
      sha256 "429bf4ee8032d8ba0c03f8e27924c00daecf9f5cdffd4b477c2b7a49b2f529bd"
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
