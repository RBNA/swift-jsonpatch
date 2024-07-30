// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JSONPatch",
    platforms: [
        .iOS(.v17),
        .tvOS(.v17),
        .visionOS(.v1),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "JSONPatch",
            targets: ["JSONPatch"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "JSONPatch",
            dependencies: [],
            swiftSettings: [
                .concurrencyChecking(),
//                .warnLongExpressionTypeChecking(),
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
    static func warnLongExpressionTypeChecking(
        typeChecking: Int = 200,
        functionBodies: Int = 200,
        for configuration: BuildConfiguration = .debug
    ) -> Self {
        unsafeFlags(
            [
                "-Xfrontend", "-warn-long-expression-type-checking=\(typeChecking)",
                "-Xfrontend", "-warn-long-function-bodies=\(functionBodies)",
            ],
            .when(configuration: configuration)
        )
    }

    enum ConcurrencyChecking: String {
        case complete
        case minimal
        case targeted
    }

    static func concurrencyChecking(_ setting: ConcurrencyChecking = .complete) -> Self {
        .enableExperimentalFeature("StrictConcurrency=\(setting)")
    }
}
