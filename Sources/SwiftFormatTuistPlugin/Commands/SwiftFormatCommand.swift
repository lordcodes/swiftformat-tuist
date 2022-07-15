// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation
import SwiftFormat
import SwiftFormatKit

struct SwiftFormatCommand {
    let command: CommandArguments
    let lint: Bool

    func run() {
        let service = SwiftFormatService(command: command, lint: lint)
        let exitCode = service.run()
        exit(exitCode.rawValue)
    }
}
