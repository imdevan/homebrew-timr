class Timr < Formula
  desc "A simple cli timer"
  homepage "https://devan.gg/timr"
  url "https://github.com/imdevan/timr-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"timr"), "./cmd/timr"
  end

  test do
    assert_match "v0.1.0", shell_output("#{bin}/timr --version")
  end
end
