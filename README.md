<p align="center">
    <img src="Art/logo.png" width="500" max-width="90%" alt="SwiftFormat Tuist Plugin" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.6-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <a href="https://github.com/lordcodes/tuist-plugin-swiftformat/releases/latest">
         <img src="https://img.shields.io/github/release/lordcodes/tuist-plugin-swiftformat.svg?style=flat" alt="Latest release" />
     </a>
    <a href="https://twitter.com/lordcodes">
        <img src="https://img.shields.io/badge/twitter-@lordcodes-blue.svg?style=flat" alt="Twitter: @lordcodes" />
    </a>
</p>

---

This is a **SwiftFormat Tuist Plugin** - a plugin for Tuist to format Swift projects using [SwiftFormat](https://github.com/nicklockwood/SwiftFormat).

&nbsp;

<p align="center">
    <a href="#features">Features</a> • <a href="#install">Install</a> • <a href="#usage">Usage</a> • <a href="#contributing-or-help">Contributing</a>
</p>

## Features

&nbsp;

## Install

To set up as a Tuist plugin in your project simply follow the [Tuist plugin install instructions](https://docs.tuist.io/plugins/using-plugins/) using the [latest version](https://github.com/lordcodes/tuist-plugin-swiftformat/releases/latest).

Add the plugin to `Config.swift`.

```swift
import ProjectDescription

let config = Config(
    plugins: [
        .git(url: "https://github.com/lordcodes/tuist-plugin-swiftformat.git", tag: "v0.1.0")
    ]
)
```

&nbsp;

## Usage

### 🖥 Via the Tuist Plugin

Run SwiftFormat Tusit Plugin's tasks via Tuist.

```terminal
USAGE: tuist format [subcommand] [-q|--quiet]

SUBCOMMANDS:
  version    Print version.

OPTIONS:
  -q, --quiet             Silence any output except errors 
```

You can obtain help using `tuist format --help` and also obtain help for each subcommand using `tuist format <subcommand> --help`.

## Contributing or Help

If you notice any bugs or have a new feature to suggest, please check out the [contributing guide](https://github.com/lordcodes/tuist-plugin-swiftformat/blob/master/CONTRIBUTING.md). If you want to make changes, please make sure to discuss anything big before putting in the effort of creating the PR.

To reach out, please contact [@lordcodes on Twitter](https://twitter.com/lordcodes).
