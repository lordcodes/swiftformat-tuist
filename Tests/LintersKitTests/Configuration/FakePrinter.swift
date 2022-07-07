// Copyright © 2022 Andrew Lord.

@testable import LintersKit

class FakePrinter: Printer {
    var messagesPrinted = [String]()
    var forcedMessagesPrinted = [String]()
    var errorsPrinted = [LintersError]()

    func printMessage(_ message: @autoclosure () -> String) {
        messagesPrinted.append(message())
    }

    func printForced(_ message: @autoclosure () -> String) {
        forcedMessagesPrinted.append(message())
    }

    func printError(_ error: LintersError) {
        errorsPrinted.append(error)
    }
}
