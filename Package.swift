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
            dependencies: ["MyTestFramework", .product(name: "Lottie", package: "lottie-spm")]),
        .binaryTarget(name: "MyTestFramework",
                      url: "https://github.com/vishwa8816/MyTestFrameworkA/releases/download/Frist/MyTestFramework.xcframework.zip",
                      checksum: "806906cda7277317b269b49e306dfb5bc520d6f3b6afc66fea9ac6dc9e47c1ac")
    ]
)
