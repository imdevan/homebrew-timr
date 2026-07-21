class Timr < Formula
  desc "A simple cli timer"
  homepage "https://devan.gg/timr"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.1/timr-darwin-amd64.tar.gz"
      sha256 "4297132c5d58a4ceee069690175bbd51e99531d3fbea99e64b8e3dc9fa5c3b6b"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.1/timr-darwin-arm64.tar.gz"
      sha256 "b748cd9cb95a0433c5c1f09628ca82b7542e76b62ae9700f71aada0d73678d2c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.1/timr-linux-amd64.tar.gz"
      sha256 "9a8082354dd65e6e169b7a7f6e69fba7bedfc70e9acd857684395d87e7f354e0"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.1/timr-linux-arm64.tar.gz"
      sha256 "a0de59d80a22aa9d4e608a4a012f742e19d0a59d779bd841080ad01ea9f81ddc"
    end
  end

  def install
    binary = OS.mac? ? "timr-darwin-" : "timr-linux-"
    binary += Hardware::CPU.intel? ? "amd64" : "arm64"
    bin.install binary => "timr"
  end

  test do
    assert_match "v0.4.1", shell_output("#{bin}/timr --version")
  end
end
