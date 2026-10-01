class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.39/lens-darwin-arm64"
      sha256 "2388bb6483075df4c800b42450d104704d46f037ae5e8d118f13f6d5f4c281aa"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.39/lens-darwin-amd64"
      sha256 "0b4c941118196663551ee23702c1ff53efecb690a7725b01698f3c9a7f337141"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.39/lens-linux-arm64"
      sha256 "4f6aafa2099a1f429db840a578df8d6ade3d7118829a1b9314db126b4aefb014"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.39/lens-linux-amd64"
      sha256 "84e735860f3bb77463007fc237897f7e8ad822ce3fe9d08b261273d6dbbf1303"
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
