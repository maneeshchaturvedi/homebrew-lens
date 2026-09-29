class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.21/lens-darwin-arm64"
      sha256 "e042150f204104a9ff07a2efc907c770c7d91a2e632e779a4ac506a77cf095df"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.21/lens-darwin-amd64"
      sha256 "09027b14639477343c01bdded8e6cbc52cc8ab18e6e2cb8791f9852fc173834d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.21/lens-linux-arm64"
      sha256 "625e7b24258a2ec6b0997ef279447c6a68ab6b668cd1180ae49bb6b7d4f35433"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.21/lens-linux-amd64"
      sha256 "046634e2c0bc02ed8b9a685718ac3725f7e3cf9155061faba1605789632e223c"
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
