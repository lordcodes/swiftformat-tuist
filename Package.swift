// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "tuist-swiftformat",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-swiftformat",
            targets: ["SwiftFormatTuistPlugin"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", .exact("0.50.3")),
    ],
    targets: [
        .executableTarget(
            name: "SwiftFormatTuistPlugin",
            dependencies: [
                "SwiftFormatKit",
            ]
        ),
        .target(
            name: "SwiftFormatKit",
            dependencies: [
                .product(name: "SwiftFormat", package: "SwiftFormat"),
            ]
        ),
        .testTarget(
            name: "SwiftFormatKitTests",
            dependencies: [
                "SwiftFormatKit",
            ]
        ),
    ]
)
