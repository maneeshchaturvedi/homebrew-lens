class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.50/lens-darwin-arm64"
      sha256 "e4d1c497511e4a005d34ea364ae0d20309f3297adae2145f73f3c1844dcbd4a6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.50/lens-darwin-amd64"
      sha256 "c54f52e82ce19436d7016c59aba17512ceef608ac2f4f66c7597fba8f3d07f73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.50/lens-linux-arm64"
      sha256 "70c23e34bb4ede1df68d76ce706053adb462e6d93559144a2bd51ff434303005"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.50/lens-linux-amd64"
      sha256 "acaae15ef180d34213365e193342d88b2e6a08bd7451f13f058d99caf1e7dac6"
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
