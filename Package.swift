// swift-tools-version:6.0
// WindowWarden - Automatic window management

import PackageDescription

let package = Package(
    name: "WindowWarden",
    platforms: [.macOS(.v15)],
    products: [.executable(name: "windowwarden", targets: ["WindowWarden"])],
    targets: [.executableTarget(name: "WindowWarden", swiftSettings: [.swiftLanguageMode(.v6)])]
)
