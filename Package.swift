// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADG-AdMobMediation-iOS-SDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ADGAdMobMediation",
            targets: ["ADGAdMobMediationTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/ADG-iOS-SDK.git",
            exact: "2.30.2"
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            "11.7.0"..<"13.0.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ADGAdMobMediationTarget",
            dependencies: [
                .target(name: "ADGAdMobMediation"),
                .product(name: "ADG", package: "ADG-iOS-SDK"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            path: "ADGAdMobMediationTarget"
        ),
        .binaryTarget(
            name: "ADGAdMobMediation",
            url: "https://github.com/AdGeneration/ADG-AdMobMediation-iOS-SDK/releases/download/2.30.2/ADGAdMobMediation.xcframework.zip",
            checksum: "6783cf20346a3c76e760c9770840f6397106482a6af9459986d5225b83533190"
        ),
    ]
)
