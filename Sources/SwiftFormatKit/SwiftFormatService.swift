// Copyright © 2022 Andrew Lord.

import Foundation
import SwiftFormat

public struct SwiftFormatService {
    private let command: CommandArguments
    private let lint: Bool

    public init(
        command: CommandArguments,
        lint: Bool
    ) {
        self.command = command
        self.lint = lint
    }

    public func run() -> ExitCode {
        let printQueue = DispatchQueue(label: "swiftformat.print")
        var stderr = FileHandle.standardError
        let stderrIsTty = isatty(STDERR_FILENO) != 0
        CLI.print = { message, type in
            printQueue.sync {
                switch type {
                case .info:
                    print(message, to: &stderr)
                case .success:
                    print(stderrIsTty ? message.inGreen : message, to: &stderr)
                case .error:
                    print(stderrIsTty ? message.inRed : message, to: &stderr)
                case .warning:
                    print(stderrIsTty ? message.inYellow : message, to: &stderr)
                case .content:
                    print(message)
                case .raw:
                    print(message, terminator: "")
                }
            }
        }

        let swiftFormatArguments = ArgumentProcessor.swiftFormatArguments(
            lint: lint,
            command: command
        )
        printer.printMessage("Running SwiftFormat with arguments: \(swiftFormatArguments)")
        let exitCode = CLI.run(
            in: FileManager.default.currentDirectoryPath,
            with: swiftFormatArguments
        )
        switch exitCode {
        case .ok:
            return .ok
        case .lintFailure:
            return .lintFailure
        case .error:
            return .error
        }
    }
}

private extension String {
    var inDefault: String { "\u{001B}[39m\(self)" }
    var inRed: String { "\u{001B}[31m\(self)\u{001B}[0m" }
    var inGreen: String { "\u{001B}[32m\(self)\u{001B}[0m" }
    var inYellow: String { "\u{001B}[33m\(self)\u{001B}[0m" }
}

extension FileHandle: TextOutputStream {
    public func write(_ string: String) {
        write(Data(string.utf8))
    }
}
