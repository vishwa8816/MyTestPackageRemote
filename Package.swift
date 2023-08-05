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
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.2.0"),
        .package(url: "https://github.com/vishwa8816/TestFrameworkP", branch: "main")
    ],
    targets: [
        .target(name: "MyTestPackageRemote",
                dependencies: [
                    .product(name: "Lottie", package: "lottie-spm"),
                    .product(name: "TestFrameworkP", package: "TestFrameworkP")
                ]
               )
    ]
)
