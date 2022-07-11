// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "tuist-format",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-format",
            targets: ["SwiftFormatTuistPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", exact: "0.49.11"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftFormatTuistPlugin",
            dependencies: [
                .product(name: "SwiftFormat", package: "SwiftFormat"),
            ]
        ),
    ]
)
