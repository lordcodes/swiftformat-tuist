// Copyright © 2022 Andrew Lord.

public enum ExitCode: Int32 {
    case ok = 0 // EX_OK
    case lintFailure = 1
    case error = 70 // EX_SOFTWARE
}
