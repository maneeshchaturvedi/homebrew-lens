class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.59/lens-darwin-arm64"
      sha256 "8e1d0dd3eff8cc8312a10bafdfe4fbe39c7a1e60db8c2c4be4e76456f2c7c375"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.59/lens-darwin-amd64"
      sha256 "e49ab03fd692e77ef4cf2fbf9ce0bf6c060390b0de6db992ba930841c757df2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.59/lens-linux-arm64"
      sha256 "d342bd44eaf5c0e2dbe3a8214147aaa8e2e8a607ecb53adeceac8feed15327bf"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.59/lens-linux-amd64"
      sha256 "21cf650c95e4c97c9f2fe3e14a29ba60f6d05f69adeb1d786f8144511d93fba1"
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
