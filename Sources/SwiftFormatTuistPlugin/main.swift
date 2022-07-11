// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation
import SwiftFormat

extension String {
    var inDefault: String { return "\u{001B}[39m\(self)" }
    var inRed: String { return "\u{001B}[31m\(self)\u{001B}[0m" }
    var inGreen: String { return "\u{001B}[32m\(self)\u{001B}[0m" }
    var inYellow: String { return "\u{001B}[33m\(self)\u{001B}[0m" }
}

extension FileHandle: TextOutputStream {
    public func write(_ string: String) {
        write(Data(string.utf8))
    }
}

private let printQueue = DispatchQueue(label: "swiftformat.print")
private var stderr = FileHandle.standardError
private let stderrIsTty = isatty(STDERR_FILENO) != 0

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

let programName = CommandLine.arguments.first ?? "tuist-format"
let arguments = [programName, FileManager.default.currentDirectoryPath] + Array(CommandLine.arguments.dropFirst())
exit(CLI.run(in: FileManager.default.currentDirectoryPath, with: arguments).rawValue)
