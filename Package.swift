// swift-tools-version:5.10.0

import PackageDescription
import Foundation

let package = Package(
    name: "NetworkKit",
    platforms: [
        .iOS("14.0"),
        .macOS("13.0"),
        .tvOS("14.0"),
        .watchOS("9.0")
    ],
    products: [
        .library(
            name: "NetworkKit",
            targets: ["NetworkKit_PrecompiledProduct"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/CorePersistence",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-precompiled/Merge",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-precompiled/Swallow",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-precompiled/SwiftAPI",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "NetworkKit_Aggregation",
            dependencies: ["NetworkKit"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "NetworkKit",
            url: "https://github.com/swift-precompiled/NetworkKit/releases/download/master-970de1724bdf1920deeca139771ba291cf70191b/NetworkKit-b631bbad21ef8e738e050ad090f1cab3e72057d0eba0e2b4480ca6b0a7871026.xcframework.zip",
            checksum: "b631bbad21ef8e738e050ad090f1cab3e72057d0eba0e2b4480ca6b0a7871026"
        ),
        .target(
            name: "NetworkKit_PrecompiledProduct",
            dependencies: [
                "NetworkKit_Aggregation",
                .product(
                    name: "CorePersistence",
                    package: "CorePersistence"
                ),
                .product(
                    name: "Merge",
                    package: "Merge"
                ),
                .product(
                    name: "Swallow",
                    package: "Swallow"
                ),
                .product(
                    name: "SwiftAPI",
                    package: "SwiftAPI"
                )
            ]
        )
    ]
)