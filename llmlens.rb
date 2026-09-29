class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.38/lens-darwin-arm64"
      sha256 "8be80b3513fd7b8a002eb064a6db1fa71004eb11ad5c76c7339942e374829e31"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.38/lens-darwin-amd64"
      sha256 "c0c178e4f25f2da3b2878dccb89f069de9e9e9af62d4f0e01e80f5708279cd95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.38/lens-linux-arm64"
      sha256 "8cfb4c4905a49343db20d3def5ab21a17556badbfba1c5b4db3154304184b0e4"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.38/lens-linux-amd64"
      sha256 "4ff19d0ac54fba35bc08d5b95334e5b5f93b05d9e518b5a3aa44d7daaeb022ec"
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
