// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "DMSansFontPackage",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "DMSansFontPackage",
            targets: ["DMSansFontPackage"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DMSansFontPackage",
            dependencies: [],
            resources: [
                .process("Resources"),
            ]
        ),
        .testTarget(
            name: "DMSansFontPackageTests",
            dependencies: ["DMSansFontPackage"]
        ),
    ]
)
