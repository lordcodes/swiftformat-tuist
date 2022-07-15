// Copyright © 2022 Andrew Lord.

import SwiftFormatKit

struct MainCommand {
    let command: CommandArguments

    init(arguments: [String]) {
        self.command = ArgumentProcessor.parse(arguments: arguments)
    }

    func run() {
        let isQuiet = command.arguments.contains { $0 == "--quiet" || $0 == "-q" }
        SwiftFormatKit.shared.printer = ConsolePrinter(quiet: isQuiet)

        switch command.subcommand {
        case "format":
            runSwiftFormat(lint: false)
        case "help":
            printHelp()
        case "lint":
            runSwiftFormat(lint: true)
        case "version":
            VersionCommand(arguments: command.arguments).run()
        default:
            printHelp()
        }
    }

    private func runSwiftFormat(lint: Bool) {
        SwiftFormatCommand(command: command, lint: lint).run()
    }

    private func printHelp() {
        let help = """
        USAGE: tuist swiftformat [<subcommand>]

        DEFAULT SUBCOMMAND:
          Run SwiftFormat in format mode.

        SUBCOMMANDS:
          format            Run SwiftFormat in format mode.
          lint              Run SwiftFormat in lint mode.
          help              Print this help information.
          version           Print SwiftFormat Tuist version.

        See 'tuist swiftformat <subcommand> --help' for detailed help.

        """
        print(help)
    }
}
