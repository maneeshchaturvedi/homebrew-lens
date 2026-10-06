class Llmlens < Formula
  desc "Stream coding agent sessions to lens-ingest"
  homepage "https://github.com/maneeshchaturvedi/homebrew-lens"
  version "0.0.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.48/lens-darwin-arm64"
      sha256 "b9c117dc2f5925955cdc7ac5ddbc46c2b729d7e534a3b090180e98f2f725f2cc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.48/lens-darwin-amd64"
      sha256 "c29038c44fdaf4b7be2a8ed1d700ab398ff2b36d9a086eb1d2c24e723ab80b37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.48/lens-linux-arm64"
      sha256 "02c5fc7ca855104f522ff5707f4289b37db1de7a3cf39f7c1183ff3a3732bb5f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-lens/releases/download/v0.0.48/lens-linux-amd64"
      sha256 "2d6ff19ec0a2affac38f6eaa0b15d10e0de5a3124dcb53eb108bf1d40aad7e3b"
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
