class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.57/lens-darwin-arm64"
      sha256 "f6fa71d2a09424569cd62a1e7f79fc6ec585dbeaa818d7325c3449840a42f2e6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.57/lens-darwin-amd64"
      sha256 "25a1495fcb4f8f13bbe68ff5ea13545406d78e50c3db8c8df70aa3f4666155f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.57/lens-linux-arm64"
      sha256 "07d9da0979af1ca7447d91c8f239955493896519816a3e9bbd72aaa16b39e2b2"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.57/lens-linux-amd64"
      sha256 "5ffd7a28eb3c9188481ecb8d2803aa23e2fbcd4bc6fd513b3171f22b126690b9"
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
