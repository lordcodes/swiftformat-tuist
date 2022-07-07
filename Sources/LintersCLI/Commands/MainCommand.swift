// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation
import LintersKit

struct MainCommand {
     let arguments: [String]

    public func run() throws {
        let (subcommand, options) = try extractSubcommand()
        switch subcommand {
        case "check":
            CheckCommand(options: options).run()
        case "version":
            VersionCommand(options: options).run()
        case "-h", "--help":
            printHelp()
        default:
            try printUnexpectedArgumentError(argument: subcommand)
        }
    }

    private func extractSubcommand() throws -> (subcommand: String, options: [String]) {
        guard arguments.count > 0, let command = arguments.first else {
            printHelp()
            throw ExitCode.failure
        }
        return (subcommand: command, options: Array(arguments.dropFirst()))
    }

    private func printUnexpectedArgumentError(argument: String) throws {
        print("Error: Unknown argument '\(argument)'\n")
        printHelp()
        throw ExitCode.failure
    }

    private func printHelp() {
        let help = """
        USAGE: \(programName) <subcommand>

        OPTIONS:
          -h, --help              Show help information.

        SUBCOMMANDS:
          version                 Print version.

        See '\(programName) <subcommand> --help' for detailed help.

        """
        print(help)
    }
}
