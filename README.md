# homebrew-tap

Homebrew formulas for these tools.

```sh
brew install cjohnhanson/tap/<tool>
```

Each formula takes the prebuilt binary from that tool's GitHub release,
so an install compiles nothing. A tool whose crate and command names
differ installs both names, and the command is the one to type.

The formulas are written by each repository's release workflow. Editing
one here by hand is overwritten by the next release.
