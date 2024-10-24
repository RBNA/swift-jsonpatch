// swift-tools-version:5.10
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
            dependencies: [],
            swiftSettings: [
                .concurrencyChecking(),
                .enableUpcomingFeature("DisableOutwardActorInference"),
            ]
        ),
        .testTarget(
            name: "JSONPatchTests",
            dependencies: ["JSONPatch"],
            path: "Tests",
            resources: [
                .process("JSONPatchTests/Resources"),
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)

extension SwiftSetting {
    enum ConcurrencyChecking: String {
        case complete
        case minimal
        case targeted
    }

    static func concurrencyChecking(_ setting: ConcurrencyChecking = .complete) -> Self {
        .enableExperimentalFeature("StrictConcurrency=\(setting)")
    }
}
