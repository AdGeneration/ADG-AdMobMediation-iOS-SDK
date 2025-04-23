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
            exact: "2.28.1"
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
            url: "https://github.com/AdGeneration/ADG-AdMobMediation-iOS-SDK/releases/download/2.28.1/ADGAdMobMediation.xcframework.zip",
            checksum: "0f28e35e32d76195023e5da9f62caa6e0d546c4c343bf51d770b04c9f812d6ef"
        ),
    ]
)
