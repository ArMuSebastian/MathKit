// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MathKit",
    products:
        [
            .library(
                name: "MathKit",
                targets:
                    [
                        "MathKit"
                    ]
            ),
        ],
    dependencies:
        [
            .package(
                name: "ConsoleDrawKit",
                url: "https://gitlab.com/ArMuSebastian/consoledrawkit",
                .branch("master")
            )
        ],
    targets:
        [
            .target(
                name: "RadixKit"
            ),
            .target(
                name: "MatrixKit",
                dependencies:
                    [
                        "ConsoleDrawKit"
                    ]
            ),
            .target(
                name: "CoordinateKit"
            ),
            .testTarget(
                name: "MatrixKitTests",
                dependencies:
                    [
                        "MatrixKit"
                    ]
            ),
            .testTarget(
                name: "RadixKitTests",
                dependencies:
                    [
                        "RadixKit"
                    ]
            ),
            .target(
                name: "MathKit",
                dependencies:
                    [
                        "CoordinateKit",
                        "RadixKit",
                        "MatrixKit"
                    ]
            )
        ]
)
