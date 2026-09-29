class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.36/lens-darwin-arm64"
      sha256 "ea3daea27697ea6f521928da172beee2f39cc7f675fe043327e6553db318ef44"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.36/lens-darwin-amd64"
      sha256 "003cd3e149ad4568301e3b2efec163af3d97500d6fa3514d356850e6d633f686"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.36/lens-linux-arm64"
      sha256 "2658f2ebefdbd6119568c1835273d94a0e7fdbc806928c6350a775becbc03f6e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.36/lens-linux-amd64"
      sha256 "2cf9281320a17900f804fc02c5b2e8475e058dddc06c50a0b5fde46e835a3cf8"
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
