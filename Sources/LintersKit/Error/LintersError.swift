// Copyright © 2022 Andrew Lord.

import Foundation

/// Error type thrown by Swift Linter's throwing APIs.
public enum LintersError: Error, Equatable {
    /// Other errors that weren't explicitly handled by the framework.
    case otherError(String)
}

extension LintersError: LocalizedError {
    public var errorDescription: String? {
        description
    }
}

extension LintersError: CustomStringConvertible {
    public var description: String {
        """
        Swift Linters encountered an error.
        Reason: \(reason)
        """
    }

    private var reason: String {
        switch self {
        case let .otherError(message):
            return "Other error, \(message)"
        }
    }
}
