<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.5-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <a href="https://github.com/lordcodes/swiftformat-tuist/releases/latest">
         <img src="https://img.shields.io/github/release/lordcodes/swiftformat-tuist.svg?style=flat" alt="Latest release" />
     </a>
    <a href="https://twitter.com/lordcodes">
        <img src="https://img.shields.io/badge/twitter-@lordcodes-blue.svg?style=flat" alt="Twitter: @lordcodes" />
    </a>
</p>

---

This is a **SwiftFormat Tuist** - a plugin for Tuist to format Swift projects using [SwiftFormat](https://github.com/nicklockwood/SwiftFormat).

&nbsp;

<p align="center">
    <a href="#install">Install</a> • <a href="#usage">Usage</a> • <a href="#contributing-or-help">Contributing</a>
</p>

## Install

To set up as a Tuist plugin in your project simply follow the [Tuist plugin install instructions](https://docs.tuist.io/plugins/using-plugins/) using the [latest version](https://github.com/lordcodes/swiftformat-tuist/releases/latest).

Add the plugin to `Config.swift`.

```swift
import ProjectDescription

let config = Config(
    plugins: [
        .git(url: "https://github.com/lordcodes/swiftformat-tuist.git", tag: "[VERSION]")
    ]
)
```

&nbsp;

## Usage

### 🖥 Via the Tuist Plugin

Run SwiftFormat Tuist's tasks via Tuist.

```terminal
USAGE: tuist swiftformat [<subcommand>]

DEFAULT SUBCOMMAND:
    Run SwiftFormat in format mode.

SUBCOMMANDS:
    format            Run SwiftFormat in format mode.
    lint              Run SwiftFormat in lint mode.
    help              Print this help information.
    version           Print SwiftFormat Tuist version.

See 'tuist swiftformat <subcommand> --help' for detailed help.

```

The plugin is a lightweight wrapper around the SwiftFormat command-line tool. If no files are specified to lint, it will pass the current directory as the first argument to SwiftFormat.

For example, a common set up would be:

- Create a `.swiftformat` config file in the root of the project.
- List all the files/directories to skip using `--excludes`.
- From root run `tuist swiftformat` to format code.
- From root run `tuist swiftformat lint` to check if code is formatted.

## Contributing or Help

If you notice any bugs or have a new feature to suggest, please check out the [contributing guide](https://github.com/lordcodes/swiftformat-tuist/blob/master/CONTRIBUTING.md). If you want to make changes, please make sure to discuss anything big before putting in the effort of creating the PR.

To reach out, please contact [@lordcodes on Twitter](https://twitter.com/lordcodes).
