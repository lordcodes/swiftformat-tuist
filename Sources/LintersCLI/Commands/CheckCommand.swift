// Copyright © 2022 Andrew Lord.

import LintersKit

struct CheckCommand {
    let options: [String]

    func run() {
        if options.contains(where: { $0 == "-h" || $0 == "--help" }) {
            printHelp()
            return
        }
        let isQuiet = options.contains { $0 == "-q" || $0 == "--quiet" }
        Linters.shared.printer = ConsolePrinter(quiet: isQuiet)
        CheckService().run()
    }

    private func printHelp() {
        let help = """
        OVERVIEW: Run linters checking for linting issues.

        USAGE: \(programName) check [--quiet]

        OPTIONS:
          -q, --quiet             Silence any output except errors
          -h, --help              Show help information.

        """
        print(help)
    }
}
