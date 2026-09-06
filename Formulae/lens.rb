class Lens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.1/lens-darwin-arm64"
      sha256 "79545e60969316fdb704343dabcd04ac13cb908a49e16a06f0ddac731022f00c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.1/lens-darwin-amd64"
      sha256 "d14f5001519b58b8fcfab767f0bb1e1c53e63b4031df8437060fce5331c613b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.1/lens-linux-arm64"
      sha256 "047e3adb2dd750c7fafa444469975ce7a4c9dd6dadb96391238edd20e4b8fda3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.1/lens-linux-amd64"
      sha256 "7b606c6d68fd0f960a150ccf752aed4ddf2946ffe7ded4d1853cd36cdebd89f1"
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
