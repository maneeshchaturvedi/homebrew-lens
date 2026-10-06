class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.44/lens-darwin-arm64"
      sha256 "e973b16c1818aa8a32bae74ca80f6a320083668532cfa941699f77c457cc4f98"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.44/lens-darwin-amd64"
      sha256 "43d689d8a483f7c163c6ea15e28f485671ec0df4b071a7af0f2b419859b7290f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.44/lens-linux-arm64"
      sha256 "df50dd1ff3429ab945836cdee64a882b7f3246a6bb0e5b872027e32962ae3afc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.44/lens-linux-amd64"
      sha256 "2d4bd4b865bd4392ae58640e9c229f84cdcf0efc6a8d3af34850da9aadf9b0b5"
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
