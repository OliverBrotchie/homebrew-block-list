class Blk < Formula
  desc "Hosts-based block list manager"
  homepage "https://github.com/OliverBrotchie/block-list"
  url "https://github.com/OliverBrotchie/block-list/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "6dcc1e2209e05e13f8edeb492765b477342f05956f0743a711fa3fc2d29c8f1c"
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
