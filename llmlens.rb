class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.35/lens-darwin-arm64"
      sha256 "82376d5bf43e2b0c95f8418808116f7a368603e694847bb18056386766e34ea8"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.35/lens-darwin-amd64"
      sha256 "824a7681fae6780e37b385eef8aa3968ef353a29b04159ea708cfe5b33e02e43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.35/lens-linux-arm64"
      sha256 "4a9cc03ba0f8c404416222c2ae3556be3e6710d0499612e0356c1fa1559eb8d9"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.35/lens-linux-amd64"
      sha256 "191b6787ae9db49d380ae11ca6de34cc97ecec2560b0a72c6b39582f179df50e"
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
