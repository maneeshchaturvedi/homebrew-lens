class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.9/lens-darwin-arm64"
      sha256 "b322ca200e074d2dfccf502a0f3b16832fc0166c77bc2b84b50e267db3b8fc75"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.9/lens-darwin-amd64"
      sha256 "862658697916b051a6528cc2f1cdb1a806d1cd79572f5a184ab5d3fb8f7614ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.9/lens-linux-arm64"
      sha256 "1f3715f3f4a299646e523178488e29b0b40eb1bacf3fdb10e509fa1c4e6b5dff"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.9/lens-linux-amd64"
      sha256 "1eb2ea77251027eea9c994eabd804f6d8efab620ad853fe31eeb0f4564ced432"
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
