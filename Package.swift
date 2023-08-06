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
                      url: "https://github.com/vishwa8816/MyTestFrameworkA/releases/download/Eight/MyTestFramework.xcframework.zip",
                      checksum: "af04cf936acb2961aa24ce86beb8c5758be4550cc1f9c6a56fe0d564d53463ae")
    ]
)

// One with issue of duplicate package
//objc[5756]: Class _TtC11_LottieStub10LottieStub is implemented in both /Users/vishwapatel/Desktop/Vishwa/SampleApps/TestProgressApp/Build/Products/Debug-iphonesimulator/MyTestFrameworkA.framework/MyTestFrameworkA (0x10c7a0398) and /Users/vishwapatel/Library/Developer/CoreSimulator/Devices/21D071A1-324E-467A-8F7C-AD13E4E90F56/data/Containers/Bundle/Application/6B98C304-14DF-4B22-803E-7B63EBCCFAB5/TestProgressApp.app/TestProgressApp (0x1040a3a70). One of the two will be used. Which one is undefined.
//(
//    name: "MyTestPackageRemote",
//    platforms: [.iOS(.v14)],
//    products: [
//        // Products define the executables and libraries a package produces, and make them visible to other packages.
//        .library(
//            name: "MyTestPackageRemote",
//            targets: ["MyTestPackageRemote"]),
//    ],
//    dependencies: [
//        .package(url: "https://github.com/airbnb/lottie-spm.git", exact:"4.2.0")
//    ],
//    targets: [
//        .target(
//            name: "MyTestPackageRemote",
//            dependencies: ["MyTestPackageWrapper"]),
//        .target(
//             name: "MyTestPackageWrapper",
//             dependencies: [
//                 .target(name: "MyTestFramework"),
//                 .product(name: "Lottie",
//                          package: "lottie-spm")
//             ]),
//        .binaryTarget(name: "MyTestFramework",
//                      url: "https://github.com/vishwa8816/MyTestFrameworkA/releases/download/Nine/MyTestFramework.xcframework.zip",
//                      checksum: "6d565ab760cdb660f458196bea25e9c646dcbb74edb0a5e364af0b285bc8b890")
//    ]
//)

// One which works fine with swift package of our own.

//(
//    name: "MyTestPackageRemote",
//    platforms: [.iOS(.v14)],
//    products: [
//        // Products define the executables and libraries a package produces, and make them visible to other packages.
//        .library(
//            name: "MyTestPackageRemote",
//            targets: ["MyTestPackageRemote"]),
//    ],
//    dependencies: [
//        .package(url: "https://github.com/vishwa8816/LottiStatic", branch: "main")
//    ],
//    targets: [
//        .target(
//            name: "MyTestPackageRemote",
//            dependencies: ["MyTestPackageWrapper"]),
//        .target(
//             name: "MyTestPackageWrapper",
//             dependencies: [
//                 .target(name: "MyTestFramework"),
//                 .product(name: "LottiStatic",
//                          package: "LottiStatic")
//             ]),
//        .binaryTarget(name: "MyTestFramework",
//                      url: "https://github.com/vishwa8816/MyTestFrameworkA/releases/download/Eight/MyTestFramework.xcframework.zip",
//                      checksum: "af04cf936acb2961aa24ce86beb8c5758be4550cc1f9c6a56fe0d564d53463ae")
//    ]
//)

