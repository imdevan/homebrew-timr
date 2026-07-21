class Timr < Formula
  desc "A simple cli timer"
  homepage "https://devan.gg/timr"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.0/timr-darwin-amd64.tar.gz"
      sha256 "5f9569cf16c5bc21901ef3500d84958085dbd97c67303b1f4a9c55a2f9ef95d0"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.0/timr-darwin-arm64.tar.gz"
      sha256 "dc0bbd95e7063466504ec0e8e12f69133ad5afc6078de69d426da86333e1e959"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.0/timr-linux-amd64.tar.gz"
      sha256 "ed7bf675f51b0d0cf04b4a9e4faab2c9956232d8d02837f85150bd74b11ea997"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.0/timr-linux-arm64.tar.gz"
      sha256 "e4e504018c59365de839f0e1ab0be14dc6154544e1de47b556ca22dca53336f2"
    end
  end

  def install
    binary = OS.mac? ? "timr-darwin-" : "timr-linux-"
    binary += Hardware::CPU.intel? ? "amd64" : "arm64"
    bin.install binary => "timr"
  end

  test do
    assert_match "v0.4.0", shell_output("#{bin}/timr --version")
  end
end
