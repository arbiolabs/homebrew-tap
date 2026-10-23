cask "agents-trace-waterfall" do
  version "1.2.2"
  sha256 "542c9411d10f242ca125475db6d06f0a04580a10e372f4e4bcf0f43a48a34434"

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
