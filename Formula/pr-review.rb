class PrReview < Formula
  desc "Reviews GitHub pull requests with a coding agent, with a terminal client"
  homepage "https://github.com/arbiolabs/pr-reviewer-agent"
  url "https://github.com/arbiolabs/pr-reviewer-agent/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "768c028a39de9d7ee879c0aee9c26f587ee7c1c6bb970bd5e85d9d818e114b64"

  depends_on "pnpm" => :build
  depends_on "rust" => :build
  depends_on "gh"
  depends_on "node"

  def install
    system "cargo", "install", *std_cargo_args(path: "tui")
    system "pnpm", "install", "--prod", "--frozen-lockfile"
    libexec.install "bin", "src", "prompts", "protocol", "migrations", "node_modules", "package.json"
    (bin/"pr-review").write_env_script libexec/"bin/pr-review.mjs", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_match "pr-review setup", shell_output("#{bin}/pr-review 2>&1", 2)
    assert_path_exists bin/"pr-review-tui"
  end
end
