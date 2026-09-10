class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.8/lens-darwin-arm64"
      sha256 "39d501f10b8464aafc41dab3e0294fcc5d891d7cc0c41b98cb802af40c91b5a3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.8/lens-darwin-amd64"
      sha256 "203328c2aacb2fe0f0febaaf6cae02cf86ba5cb655a8564f6112244c271bae7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.8/lens-linux-arm64"
      sha256 "712cb9c6a38576350b5765766608aaabda94294e39f9da07899eef73b6a760d6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.8/lens-linux-amd64"
      sha256 "ab559e2568d95b3989219090813f36b17243c51a9abe0c12ea50b3c0fe4b5fad"
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
