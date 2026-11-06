cask "agents-trace-waterfall" do
  version "1.4.0"
  sha256 "5a8acecac9a91076b43a8c3dfbe2b5d9850f27a7864d9ebec213847d66662ce4"

  url "https://github.com/arbiolabs/agents-trace-waterfall/releases/download/v#{version}/Agents-Trace-Waterfall-#{version}-macos-arm64.zip"
  name "Agents Trace Waterfall"
  desc "Waterfall view of coding-agent sessions"
  homepage "https://github.com/arbiolabs/agents-trace-waterfall"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Agents Trace Waterfall.app"

  # The app is ad-hoc signed, not notarized: without this, Gatekeeper refuses its first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Agents Trace Waterfall.app"],
        writable_paths: ["Agents Trace Waterfall.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/.config/agents-trace-waterfall",
    "~/.local/share/agents-trace-waterfall",
    "~/.local/state/agents-trace-waterfall",
  ]
end
