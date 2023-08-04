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
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.2.0")
    ],
    targets: [
        .target(
            name: "MyTestPackageRemote",
            dependencies: ["MyTestPackageWrapper"]),
        .target(
             name: "MyTestPackageWrapper",
             dependencies: [
                 .target(name: "MyTestFramework"),
                 .product(name: "Lottie",
                          package: "lottie-spm")
             ]),
        .binaryTarget(name: "MyTestFramework",
                      url: "https://github.com/vishwa8816/MyTestFrameworkA/releases/download/Second/MyTestFramework.xcframework.zip",
                      checksum: "35c5b4f025ab70b0db0317a03c6edddc15e45a7b0722687cc935fc9f4b867140")
    ]
)
