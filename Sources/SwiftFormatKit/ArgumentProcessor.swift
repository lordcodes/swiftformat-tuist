// Copyright © 2022 Andrew Lord.

import Foundation

public enum ArgumentProcessor {
    public static func parse(arguments: [String]) -> CommandArguments {
        let programName = arguments.first ?? "tuist-swiftformat"
        let remainingArguments = Array(arguments.dropFirst())

        let subcommand: String
        let outputArguments: [String]
        if let first = remainingArguments.first, ArgumentProcessor.validSubcommands.contains(first) {
            subcommand = remainingArguments.first ?? "format"
            outputArguments = Array(remainingArguments.dropFirst())
        } else {
            subcommand = "format"
            outputArguments = remainingArguments
        }
        return CommandArguments(programName: programName, subcommand: subcommand, arguments: outputArguments)
    }

    public static func swiftFormatArguments(lint: Bool, command: CommandArguments) -> [String] {
        var commandArguments = command.arguments.filter { $0 != "--lint" }
        var outputArguments = [command.programName]
        if commandArguments.isEmpty {
            outputArguments.append(FileManager.default.currentDirectoryPath)
        } else if let argument = commandArguments.first, argument.starts(with: "--") || argument.starts(with: "-") {
            outputArguments.append(FileManager.default.currentDirectoryPath)
        } else if let argument = commandArguments.first {
            outputArguments.append(argument)
            commandArguments = Array(commandArguments.dropFirst())
        }
        if lint {
            outputArguments.append("--lint")
        }
        outputArguments.append(contentsOf: commandArguments)
        return outputArguments
    }

    private static let validSubcommands: [String] = ["format", "help", "lint", "version"]
}
