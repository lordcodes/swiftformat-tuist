// Copyright © 2022 Andrew Lord.

import Foundation

/// Service to run linters to check for lint issues.
public struct CheckService {
    private let printer: Printer

    /// Create the service.
    public init() {
        self.init(printer: Linters.shared.printer)
    }

    init(printer: Printer) {
        self.printer = printer
    }

    /// Run the service.
    public func run() {

    }
}
