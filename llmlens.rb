class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.30/lens-darwin-arm64"
      sha256 "d15097d168397a510921195a73039e23aae37ca0e12708150d01aa9ae1989af7"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.30/lens-darwin-amd64"
      sha256 "d9b40d4a3fd607f3dc84c6cd93129b4704f870d1ce711c31d2a90016383c4373"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.30/lens-linux-arm64"
      sha256 "824758d260ad60175a76950a58300308211616e5fd48100ecdfb4e99dee998a4"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.30/lens-linux-amd64"
      sha256 "61899f4ebe706a75ed13a4f998526d063f4e2978e2f3ff136e93a8fa1342c208"
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
