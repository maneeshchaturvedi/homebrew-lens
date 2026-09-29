class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.26/lens-darwin-arm64"
      sha256 "56006552214e94d7f208580141abfc93304075189e09f4d507f4917a0f242961"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.26/lens-darwin-amd64"
      sha256 "e10aefae56af8948b8c2685cb945302dcde8ef4892060372886c2c4011cd7df1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.26/lens-linux-arm64"
      sha256 "a42babd4b34bfbe43787322bda8715e7a3f8999a2aef0ca3c19a43a05e1ddc33"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.26/lens-linux-amd64"
      sha256 "5b8af224c7eab4d1662424e77724d4d581ca72836cbf562b648479a83ceb3736"
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
