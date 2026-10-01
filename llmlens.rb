class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.40/lens-darwin-arm64"
      sha256 "1be7d16a6c61ffe739f53a7d0c9fc421a5be9139f2d639c05bc0c07c139ebeb6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.40/lens-darwin-amd64"
      sha256 "8f64c73ce21e1e5ab6600628ca5c62096b170d41bc78261db519eb6cfb5fac8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.40/lens-linux-arm64"
      sha256 "cb5b48370fd393b837379678afe3d9183051e3bad6eaf9bf2c3ec3b92385b8d4"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.40/lens-linux-amd64"
      sha256 "e2b5ce3e9749ef06b0be730a03fe89e8341df8f1ee40f6163958fedf43d9430d"
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
