// Copyright © 2022 Andrew Lord.

/// Configuration of the SwiftFormatKit framework.
public class SwiftFormatKit {
    /// Shared SwiftFormatKit instance.
    public static let shared = SwiftFormatKit()

    /// Control outputting of messages and errors, by default does nothing.
    ///
    /// There is a `ConsolePrinter` to print to console for CLI tools.
    public var printer: Printer = NoPrinter()
}

var printer: Printer {
    SwiftFormatKit.shared.printer
}
