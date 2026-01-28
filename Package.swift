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
            "2.34.0"..<"3.0.0"
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
            url: "https://github.com/AdGeneration/ADG-AdMobMediation-iOS-SDK/releases/download/2.34.1/ADGAdMobMediation.xcframework.zip",
            checksum: "33daca3f75b49093b26e95561ef7da57b8535b1a131a05a9f9bd14ffe5efa024"
        ),
    ]
)
