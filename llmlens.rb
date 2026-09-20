class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.13/lens-darwin-arm64"
      sha256 "988d54ddef3a76179b36c5fb174fcea7dc2bbde2a363850bca0f3676ec65869f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.13/lens-darwin-amd64"
      sha256 "02cf1b1887ff86ccd95e57ab70ef598b370802d979a8c3cadc8b4879bfcad990"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.13/lens-linux-arm64"
      sha256 "cf89e1c3e69ffe652f219b5a27b96dbd2f6ee245be492b33b766dba718328cd6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.13/lens-linux-amd64"
      sha256 "ef75487ba47b8de6554d391dd06256c0bbd572a8334c9b582d9c48868cc64c1b"
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
