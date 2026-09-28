class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.20/lens-darwin-arm64"
      sha256 "84090164e2f7625d1c0b26fe734da85465a94bc9fede5b2f4d334c0f742f0f8c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.20/lens-darwin-amd64"
      sha256 "7cad37da64bd807fe15b97e377661588e2888bb8b0bb6eb3d58160527818d861"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.20/lens-linux-arm64"
      sha256 "b6800289342db9a22f408bcbec5c7d3a4a059d691d17ed7f02c9f26f315fd3c3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.20/lens-linux-amd64"
      sha256 "b35080c43e2c55cdb7bdee4752b7924e812c02318744d4a1e3c2b199a837dd02"
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
