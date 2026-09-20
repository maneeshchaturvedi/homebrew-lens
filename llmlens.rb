class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.12/lens-darwin-arm64"
      sha256 "cac1fbcb429d1f7c5153ae919a3dcc1a461df767fee0b4e66f663cfa49fa4979"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.12/lens-darwin-amd64"
      sha256 "cb8c8abb4654114c8e24327ea038f90a960b5f254b5b7ada4a017d358f0ea98f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.12/lens-linux-arm64"
      sha256 "f54912ea4139c66fae2f9d100a4ab934b94b36b940bdafcf5f00a029c224d7b2"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.12/lens-linux-amd64"
      sha256 "1008ba0d6277491197b69283f1ff2cd5b6951e5132d3123edb577a47fa883eb2"
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
