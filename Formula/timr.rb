class Timr < Formula
  desc "A simple cli timer"
  homepage "https://devan.gg/timr"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.3.2/timr-darwin-amd64.tar.gz"
      sha256 "2f4650588b1127c18b47a073cb4a04b8f7a1f05df7ed07c9a0c0bd716236b97f"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.3.2/timr-darwin-arm64.tar.gz"
      sha256 "ebb06d951ea37c27c2d1f3b21d9b516eda471af75f267f445d74d062cdbdfbf8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.3.2/timr-linux-amd64.tar.gz"
      sha256 "db096c33b7b01be50a8ae465d82640ac166ee9885e95869b388be78add5c6fdf"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.3.2/timr-linux-arm64.tar.gz"
      sha256 "0eabe77826ce1297425d64e25ad59750ac46a8f7287facaa745e91f87d126d18"
    end
  end

  def install
    binary = OS.mac? ? "timr-darwin-" : "timr-linux-"
    binary += Hardware::CPU.intel? ? "amd64" : "arm64"
    bin.install binary => "timr"
  end

  test do
    assert_match "v0.3.2", shell_output("#{bin}/timr --version")
  end
end
