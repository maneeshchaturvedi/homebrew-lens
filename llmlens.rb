class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.54/lens-darwin-arm64"
      sha256 "1a034c156006f83afa234800ea0ef2ed1480a0dbaa64031b4e31a017a32315df"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.54/lens-darwin-amd64"
      sha256 "ea893c3365f31e32d8906c9a4f77cf0ed53885f0aa9640b64e25a73fe83a1bda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.54/lens-linux-arm64"
      sha256 "7bf87dd413cc235c0ba18f417b579f2c2c7e3e661b5c1e4002035cf29a6e829a"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.54/lens-linux-amd64"
      sha256 "f9ead30d27e02100910b4f0c959ba93e04e9029b8cddfb0067013f357203e8d1"
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
