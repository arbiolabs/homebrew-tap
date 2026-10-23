# Arbio Labs Homebrew tap

```sh
brew tap arbiolabs/tap
```

| Install | What |
|---|---|
| `brew install --cask arbiolabs/tap/agents-trace-waterfall` | [Agents Trace Waterfall](https://github.com/arbiolabs/agents-trace-waterfall) desktop app. It runs its own collector. |
| `brew install arbiolabs/tap/agents-trace-waterfall` | Its command line: `trace-tui` (terminal UI, collector, import/export), the desktop binary and `simulated-live`. `brew services start agents-trace-waterfall` keeps the collector running. |
| `brew install arbiolabs/tap/pr-review` | [pr-review](https://github.com/arbiolabs/pr-reviewer-agent): the CLI and its terminal client `pr-review-tui`, built from source. Run `pr-review setup` next. |

Agents Trace Waterfall ships for Apple Silicon Macs only.
