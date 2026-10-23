cask "agents-trace-waterfall" do
  version "1.2.0"
  sha256 "57a7a37e9a060b95f17896c16f8b0baf2b43b48f43636e4eb9bccd11895faf6d"

  url "https://github.com/arbiolabs/agents-trace-waterfall/releases/download/v#{version}/Agents-Trace-Waterfall-#{version}-macos-arm64.zip"
  name "Agents Trace Waterfall"
  desc "Waterfall view of coding-agent sessions"
  homepage "https://github.com/arbiolabs/agents-trace-waterfall"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Agents Trace Waterfall.app"

  # The app is ad-hoc signed, not notarized: without this, Gatekeeper refuses its first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Agents Trace Waterfall.app"]
  end

  zap trash: [
    "~/.config/agents-trace-waterfall",
    "~/.local/share/agents-trace-waterfall",
    "~/.local/state/agents-trace-waterfall",
  ]
end
