class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.42/lens-darwin-arm64"
      sha256 "f04d4bb4c01012199e8bd44d441101d528ec71fc6ff7e39a788cc806cebf02bb"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.42/lens-darwin-amd64"
      sha256 "3d5d4dce66245d547e8d825c921cf39b925d2ff71379b1e4e84e5fe9eace3768"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.42/lens-linux-arm64"
      sha256 "31c3dab172e8c36eee682b30eeb151c2a4a89b80413b124ad550c74407504e53"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.42/lens-linux-amd64"
      sha256 "c950127b7917be2c9d492315c5ba73349e2678afdb5ef5c0d1cbf3eca6564b51"
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
