class AgentsTraceWaterfall < Formula
  desc "Waterfall view of coding-agent sessions: terminal UI and collector"
  homepage "https://github.com/arbiolabs/agents-trace-waterfall"
  url "https://github.com/arbiolabs/agents-trace-waterfall/releases/download/v1.4.0/agents-trace-waterfall-1.4.0-macos-arm64.tar.gz"
  sha256 "3f237614eec854f2dee26e09d5643acb2ce35ac0701ab810585f79652f7b941f"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "trace-tui", "agents-trace-waterfall", "simulated-live"
  end

  service do
    run [opt_bin/"trace-tui", "collector", "start"]
    keep_alive true
    log_path var/"log/agents-trace-waterfall.log"
    error_log_path var/"log/agents-trace-waterfall.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trace-tui --version")
  end
end
