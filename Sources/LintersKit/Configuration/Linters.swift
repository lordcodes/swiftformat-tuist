// Copyright © 2022 Andrew Lord.

/// Configuration of the LintersKit framework.
public class Linters {
    /// Shared Linters instance.
    public static let shared = Linters()

    /// Control outputting of messages and errors, by default does nothing.
    ///
    /// There is a `ConsolePrinter` to print to console for CLI tools.
    public var printer: Printer = NoPrinter()
}
