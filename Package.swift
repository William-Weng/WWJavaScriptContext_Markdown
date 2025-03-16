// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWJavaScriptContext_Markdown",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "WWJavaScriptContext_Markdown", targets: ["WWJavaScriptContext_Markdown"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWJavaScriptContext", from: "1.1.0"),
    ],
    targets: [
        .target(name: "WWJavaScriptContext_Markdown", dependencies: ["WWJavaScriptContext"], resources: [.process("Script"), .copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
