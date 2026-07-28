class Timr < Formula
  desc "A simple cli timer"
  homepage "https://devan.gg/timr"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.2/timr-darwin-amd64.tar.gz"
      sha256 "d95a61e544e532c932b9816bdb37c3f64e6d48008670e0718b6b8325642054ef"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.2/timr-darwin-arm64.tar.gz"
      sha256 "b398155f9dcdb2a6ac05e449c23dd608337b1063a64a7f264da07092dfcaadf5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.2/timr-linux-amd64.tar.gz"
      sha256 "037879a1bb6ac5eeee818621e1ccac35b26e280194ada6ba97f57fbefcc2126e"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/timr-cli/releases/download/v0.4.2/timr-linux-arm64.tar.gz"
      sha256 "01445f46983ddfff029f51f97f1144ec2c5d1d686d4dd2b4aa9e4a6882dd222d"
    end
  end

  def install
    binary = OS.mac? ? "timr-darwin-" : "timr-linux-"
    binary += Hardware::CPU.intel? ? "amd64" : "arm64"
    bin.install binary => "timr"
  end

  test do
    assert_match "v0.4.2", shell_output("#{bin}/timr --version")
  end
end
