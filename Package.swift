// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "linters",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-linters",
            targets: ["LintersCLI"]
        ),
        .executable(
            name: "swiftlinters",
            targets: ["LintersCLI"]
        ),
        .library(name: "LintersKit", targets: ["LintersKit"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.47.1/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "82ef90b7d76b02e41edd73423687d9cedf0bb9849dcbedad8df3a461e5a7b555"
        ),
        .binaryTarget(
            name: "swiftformat",
            url: "https://github.com/lordcodes/SwiftFormat/releases/download/0.49.11/swiftformat.artifactbundle.zip",
            checksum: "43e26b14617d2bc85aa537e08bf787fbb64193f72d4f991e226f43a914ca7882"
        ),
        .executableTarget(
            name: "LintersCLI",
            dependencies: ["LintersKit", "SwiftLintBinary", "swiftformat"]
        ),
        .target(
            name: "LintersKit",
            dependencies: []
        ),
        .testTarget(
            name: "LintersKitTests",
            dependencies: ["LintersKit"]
        ),
    ]
)
