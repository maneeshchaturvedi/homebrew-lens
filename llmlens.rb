class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.14/lens-darwin-arm64"
      sha256 "526f76ae9d273cfbfceab400a1ed2d1918ae67da2be9a068b2ca2f1dbd5dc8cc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.14/lens-darwin-amd64"
      sha256 "ad6bed6d387421ba2bfe37f85e94bba9ec5ea82be88a5426a13d0a9cd093fd25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.14/lens-linux-arm64"
      sha256 "bfbf82e3fcdb93ee662c4a4858d0a6713469b047772b190c986ba01c23193b4e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.14/lens-linux-amd64"
      sha256 "f68a8b3166b7ba5e147630cdcf3a5a422a0f99abb58b3ecdd96c527de0b25c94"
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
