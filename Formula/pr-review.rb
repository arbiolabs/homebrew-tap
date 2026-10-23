class PrReview < Formula
  desc "Reviews GitHub pull requests with a coding agent, with a terminal client"
  homepage "https://github.com/arbiolabs/pr-reviewer-agent"
  url "https://github.com/arbiolabs/pr-reviewer-agent/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "e8e2a9c85031d6fa00ddfba8569833cd3112b57bd14ea31800aac24aa0608019"

  depends_on "pnpm" => :build
  depends_on "rust" => :build
  depends_on "gh"
  depends_on "node"

  def install
    system "cargo", "install", *std_cargo_args(path: "tui")
    system "pnpm", "install", "--prod", "--frozen-lockfile"
    libexec.install "bin", "src", "prompts", "protocol", "migrations", "node_modules", "package.json"
    (bin/"pr-review").write_env_script libexec/"bin/pr-review.mjs", PATH: "#{formula_opt_bin("node")}:$PATH"
  end

  test do
    assert_match "pr-review setup", shell_output("#{bin}/pr-review 2>&1", 2)
    assert_path_exists bin/"pr-review-tui"
  end
end
