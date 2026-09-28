class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.19/lens-darwin-arm64"
      sha256 "50a25f769be7948d36f24d3400d28c118507b0ccaf755c8940a1add73993b7a3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.19/lens-darwin-amd64"
      sha256 "cf56416fb1dea2a6ec1d355b4e157c00bfc86d00e9744cba7aa4ab288dc4887c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.19/lens-linux-arm64"
      sha256 "090474cdcf3eb5065391a4241007f6750c0bacbb7e049e5dfba5af3324b0b782"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.19/lens-linux-amd64"
      sha256 "0aeaf237e7655f97621ddde5712e52be76e25e28b6aaad66cbb997864804e041"
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
