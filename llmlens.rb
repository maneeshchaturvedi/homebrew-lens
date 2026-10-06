class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.50/lens-darwin-arm64"
      sha256 "4466561ce215beac7f0498818e71b14437c141f549c75af9d68f512383fe0a8c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.50/lens-darwin-amd64"
      sha256 "c93f7e71d946e5a04d89d7ec8dd91f677618c2185683317c1cd731a00def4b40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.50/lens-linux-arm64"
      sha256 "97200f7484cfdb2531590a4a2fe47fb5c8ccbe864056a67fb094bb9c2d06f94b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.50/lens-linux-amd64"
      sha256 "2cb7f37e78e0d15a94982fa5c6ab68c81a83ebaf4be8c9eb81371c605fd6177d"
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
