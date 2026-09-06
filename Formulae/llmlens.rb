class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.4/lens-darwin-arm64"
      sha256 "52ebb00d1b5ba6052cd589832cc5bae9bcc21772632e16d52576e10125273596"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.4/lens-darwin-amd64"
      sha256 "6c2efbfdba3f616d09710f603149579db04e9fdee1a00e9d275c3cf9c7b05067"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.4/lens-linux-arm64"
      sha256 "421c2486148d861bb5753b96d598b15551f24c1be82f9d75881ea3936bcfb783"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.4/lens-linux-amd64"
      sha256 "5be2ea121cebd8396f7c3c01d97ad9b67def253d6e1fb75afb8e21d7b2917064"
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
