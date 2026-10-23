class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.53/lens-darwin-arm64"
      sha256 "f78f3b9f56dfb23ab0698300a17c6e5c83b3ff0f47580ce84ad32cc2f3defb45"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.53/lens-darwin-amd64"
      sha256 "142857500b0e7652d53e32d2d0d10e04549a3c3b6a8c65de4c65b9fb6e67d8ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.53/lens-linux-arm64"
      sha256 "f35e9790304e4758583992383b38e292e9a5db0bfafa2d18deaf9f6303767ee8"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.53/lens-linux-amd64"
      sha256 "7a409abeaa0cf2faa295093bc7876d12ea560311a9a6f8dd6a3362234af7c5d3"
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
