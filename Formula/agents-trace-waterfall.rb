class AgentsTraceWaterfall < Formula
  desc "Waterfall view of coding-agent sessions: terminal UI, collector and desktop binary"
  homepage "https://github.com/arbiolabs/agents-trace-waterfall"
  url "https://github.com/arbiolabs/agents-trace-waterfall/releases/download/v1.2.0/agents-trace-waterfall-1.2.0-macos-arm64.tar.gz"
  sha256 "1484e304012803727d2280020584d66e06c669e875939b7bb895b779850f4c77"
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
