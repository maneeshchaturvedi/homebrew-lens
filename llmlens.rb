class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.22/lens-darwin-arm64"
      sha256 "850e8b0e1bf3b5f9bdff5210c1150f45e1dc4893424d965667b772c17cccaaf1"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.22/lens-darwin-amd64"
      sha256 "9c548adb1c3e7c029169c41f1db6ed918b0fed5a1a096b5b5adc1f5f84aa7208"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.22/lens-linux-arm64"
      sha256 "36f4bc723531d08d962032ba905709ef79774c8dbcbfb8bdfff756f0293284f8"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.22/lens-linux-amd64"
      sha256 "de676062cccb0488f5565606f9778f81bacfed2ddd2e678fd363910e10d44c66"
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
