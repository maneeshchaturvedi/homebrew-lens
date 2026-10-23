class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.55/lens-darwin-arm64"
      sha256 "4e9fd07ff99e5fa2a43f07dc492abd742b3a9ce64a839be1707781c0cdfc9963"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.55/lens-darwin-amd64"
      sha256 "5807af91b2b24f197f4303b7415f9ed562b5ec4fc3aed5e8eda16e456d32bbe2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.55/lens-linux-arm64"
      sha256 "515854a82545413b6f6de2f41363cdfef86e6e255ff7d767390d7b12d49f5f11"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.55/lens-linux-amd64"
      sha256 "bb608f81422dd20415d0c8b97325d4251dbaa7654e0e2562bccfb1743ab8bfaf"
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
