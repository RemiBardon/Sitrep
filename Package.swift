// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sitrep",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .executable(name: "sitrep", targets: ["Sitrep"]),
        .library(name: "SitrepCore", targets: ["SitrepCore"])
    ],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50300.0")),
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.2")
    ],
    targets: [
        .target(name: "Sitrep", dependencies: ["SitrepCore",
                                               .product(name: "ArgumentParser",
                                                        package: "swift-argument-parser")]),
        .target(name: "SitrepCore", dependencies: ["SwiftSyntax",
                                                   "Yams",
                                                   .product(name: "ArgumentParser",
                                                            package: "swift-argument-parser")]),
        .testTarget(name: "SitrepCoreTests", dependencies: ["SitrepCore"], exclude: ["Inputs"])
    ]
)
