class Blk < Formula
  desc "Hosts-based block list manager"
  homepage "https://github.com/OliverBrotchie/block-list"
  url "https://github.com/OliverBrotchie/block-list/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "bf5304f896201864d33ac3b76f977211c04100928080ad019ba68bc4282f003b"
  license "GPL-3.0"
  head "https://github.com/OliverBrotchie/block-list.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args.reject { |arg| arg == "--locked" }
  end

  test do
    assert_match "blk", shell_output("#{bin}/blk --version")
  end
end
