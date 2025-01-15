// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JSONPatch",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "JSONPatch",
            targets: ["JSONPatch"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "JSONPatch",
            dependencies: []
        ),
        .testTarget(
            name: "JSONPatchTests",
            dependencies: ["JSONPatch"],
            path: "Tests",
            resources: [
                .process("JSONPatchTests/Resources"),
            ]
        )
    ]
)