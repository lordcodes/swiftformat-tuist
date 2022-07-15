// Copyright © 2022 Andrew Lord.

import Foundation
import XCTest

@testable import SwiftFormatKit

class ArgumentProcessorTests: XCTestCase {
    func test_parse_emptyArguments() {
        let command = ArgumentProcessor.parse(arguments: [])

        XCTAssertEqual(command, CommandArguments(programName: "tuist-swiftformat", subcommand: "format", arguments: []))
    }

    func test_parse_programName() {
        let command = ArgumentProcessor.parse(arguments: ["test-program"])

        XCTAssertEqual(command, CommandArguments(programName: "test-program", subcommand: "format", arguments: []))
    }

    func test_parse_noSubcommandWithArguments() {
        let command = ArgumentProcessor.parse(
            arguments: ["test-program", "--report", ".build/reports/swiftformat.json"]
        )

        XCTAssertEqual(
            command,
            CommandArguments(programName: "test-program", subcommand: "format", arguments: ["--report", ".build/reports/swiftformat.json"])
        )
    }

    func test_parse_lintSubcommand() {
        let command = ArgumentProcessor.parse(arguments: ["test-program", "lint"])

        XCTAssertEqual(command, CommandArguments(programName: "test-program", subcommand: "lint", arguments: []))
    }

    func test_parse_lintSubcommandWithArguments() {
        let command = ArgumentProcessor.parse(
            arguments: ["test-program", "lint", "--report", ".build/reports/swiftformat.json"]
        )

        XCTAssertEqual(
            command,
            CommandArguments(programName: "test-program", subcommand: "lint", arguments: ["--report", ".build/reports/swiftformat.json"])
        )
    }

    func test_swiftFormatArguments_emptyArguments() {
        let currentDirectory = FileManager.default.currentDirectoryPath

        let format = ArgumentProcessor.swiftFormatArguments(
            lint: false,
            command: CommandArguments(programName: "tuist-swiftformat", subcommand: "format", arguments: [])
        )
        XCTAssertEqual(format, ["tuist-swiftformat", currentDirectory])

        let lint = ArgumentProcessor.swiftFormatArguments(
            lint: true,
            command: CommandArguments(programName: "tuist-swiftformat", subcommand: "lint", arguments: [])
        )
        XCTAssertEqual(lint, ["tuist-swiftformat", currentDirectory, "--lint"])
    }

    func test_swiftFormatArguments_lintArgumentSpecified() {
        let currentDirectory = FileManager.default.currentDirectoryPath

        let format = ArgumentProcessor.swiftFormatArguments(
            lint: false,
            command: CommandArguments(programName: "tuist-swiftformat", subcommand: "format", arguments: ["--lint"])
        )
        XCTAssertEqual(format, ["tuist-swiftformat", currentDirectory])

        let lint = ArgumentProcessor.swiftFormatArguments(
            lint: true,
            command: CommandArguments(programName: "tuist-swiftformat", subcommand: "lint", arguments: ["--lint"])
        )
        XCTAssertEqual(lint, ["tuist-swiftformat", currentDirectory, "--lint"])
    }

    func test_swiftFormatArguments_pathSpecified() {
        let format = ArgumentProcessor.swiftFormatArguments(
            lint: false,
            command: CommandArguments(programName: "tuist-swiftformat", subcommand: "format", arguments: ["project-dir"])
        )
        XCTAssertEqual(format, ["tuist-swiftformat", "project-dir"])

        let lint = ArgumentProcessor.swiftFormatArguments(
            lint: true,
            command: CommandArguments(programName: "tuist-swiftformat", subcommand: "lint", arguments: ["project-dir"])
        )
        XCTAssertEqual(lint, ["tuist-swiftformat", "project-dir", "--lint"])
    }

    func test_swiftFormatArguments_reportArgument() {
        let arguments = ["project-dir", "--lint", "--report", ".build/report/swiftformat.json"]

        let format = ArgumentProcessor.swiftFormatArguments(
            lint: false,
            command: CommandArguments(programName: "tuist-swiftformat", subcommand: "format", arguments: arguments)
        )
        XCTAssertEqual(format, ["tuist-swiftformat", "project-dir", "--report", ".build/report/swiftformat.json"])

        let lint = ArgumentProcessor.swiftFormatArguments(
            lint: true,
            command: CommandArguments(programName: "tuist-swiftformat", subcommand: "lint", arguments: arguments)
        )
        XCTAssertEqual(lint, ["tuist-swiftformat", "project-dir", "--lint", "--report", ".build/report/swiftformat.json"])
    }
}
