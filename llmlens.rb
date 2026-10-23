class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.52/lens-darwin-arm64"
      sha256 "56332d054a24c6099b4bbfbbfb412e03765b8f6686290f90bf0c4a7dd4334c0c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.52/lens-darwin-amd64"
      sha256 "856a77656589ed1e147fe8d5ea2c52846196a34c47a3e14610ea4ea8e521acbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.52/lens-linux-arm64"
      sha256 "f1459be4d9f2fcd1dabc9a6820e3835c178597d38598ee735bf4450b9ae6a27e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.52/lens-linux-amd64"
      sha256 "9010f2818ae1b8d6d344c7482303b771ef70e5a50a34b24f859ac093001018f0"
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
