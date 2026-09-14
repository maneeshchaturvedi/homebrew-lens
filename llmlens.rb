class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.10/lens-darwin-arm64"
      sha256 "7e4ec40f16ce41618bd250472d9da3c69daa7a00775d0caf5e51dc5ad901fad4"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.10/lens-darwin-amd64"
      sha256 "c151f90285782164f61fc1d949ca7ac436531fa58f9cad60f137d4a2506c6ce0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.10/lens-linux-arm64"
      sha256 "4afb0655179fcc86392d5f500c82da0448f5ec9ae7c7b536f9ce827a14378ce0"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.10/lens-linux-amd64"
      sha256 "506cf7f1642cb7951d99ac80ebb7ebccf7daf330fe4ab1d06dcd76431fc30a6c"
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
