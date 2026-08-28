// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-dimension-pair",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Dimension Pair",
            targets: ["Dimension Pair"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-dimension.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-pair.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-dimension-direction.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Dimension Pair",
            dependencies: [
                .product(name: "Dimension", package: "swift-dimension"),
                .product(name: "Pair", package: "swift-pair"),
                .product(name: "Dimension Direction", package: "swift-dimension-direction"),
            ]
        ),
        .testTarget(
            name: "Dimension Pair Tests",
            dependencies: [
                "Dimension Pair",
                .product(name: "Dimension", package: "swift-dimension"),
                .product(name: "Pair", package: "swift-pair"),
                .product(name: "Dimension Direction", package: "swift-dimension-direction"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
