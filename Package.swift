// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyTestPackageRemote",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MyTestPackageRemote",
            targets: ["MyTestPackageRemote"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vishwa8816/LottiStatic", branch: "main")
    ],
    targets: [
        .target(
            name: "MyTestPackageRemote",
            dependencies: ["MyTestPackageWrapper"]),
        .target(
             name: "MyTestPackageWrapper",
             dependencies: [
                 .target(name: "MyTestFramework"),
                 .product(name: "LottiStatic",
                          package: "LottiStatic")
             ]),
        .binaryTarget(name: "MyTestFramework",
                      url: "https://github.com/vishwa8816/MyTestFrameworkA/releases/download/Seven/MyTestFramework.xcframework.zip",
                      checksum: "2d437aa37d0d98b82ff7869566def1a9dce670a093015d1fa3f81c5a58bcd83d")
    ]
)
