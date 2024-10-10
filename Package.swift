// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import PackageDescription

let package = Package(
    name: "matter4swift-runtime",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "matter4swift-runtime",
            targets: ["matter4swift-runtime"]),
    ],
    targets: [
        .target(
            name: "matter4swift-runtime"),
        .testTarget(
            name: "matter4swiftTests",
            dependencies: ["matter4swift-runtime"]),
    ]
)
