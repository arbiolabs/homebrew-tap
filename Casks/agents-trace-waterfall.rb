cask "agents-trace-waterfall" do
  version "1.3.0"
  sha256 "3f54ff988209edd1b0390caee39cbaf38c80f48d2d6993cd74a38af3f6a3d5bc"

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
