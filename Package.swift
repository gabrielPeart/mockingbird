// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Mockingbird",
  products: [
    .library(name: "Mockingbird", targets: ["Mockingbird"]),
    .executable(name: "mockingbird", targets: ["MockingbirdCli"]),
    
    // For local dev only. Uncomment before running `$ swift package generate-xcodeproj`.
    //.library(name: "MockingbirdGenerator", targets: ["MockingbirdGenerator"]),
  ],
  dependencies: [
    .package(url: "https://github.com/tuist/XcodeProj.git", from: "7.0.0"),
    .package(url: "https://github.com/jpsim/SourceKitten.git", from: "0.24.0"),
    .package(url: "https://github.com/apple/swift-package-manager.git", .exact("0.4.0")),
  ],
  targets: [
    .target(
      name: "Mockingbird",
      dependencies: [],
      path: "MockingbirdFramework",
      linkerSettings: [.linkedFramework("XCTest")]
    ),
    .target(
      name: "MockingbirdGenerator",
      dependencies: [
        "SourceKittenFramework",
        "XcodeProj",
      ],
      path: "MockingbirdGenerator"
    ),
    .target(
      name: "MockingbirdCli",
      dependencies: [
        "MockingbirdGenerator",
        "SPMUtility",
        "XcodeProj",
      ],
      path: "MockingbirdCli"
    ),
    .target(
      name: "MockingbirdTestsHost",
      dependencies: [
        "MockingbirdModuleTestsHost",
      ],
      path: "MockingbirdTestsHost",
      exclude: ["Module", "Performance"]
    ),
    .target(
      name: "MockingbirdModuleTestsHost",
      dependencies: [],
      path: "MockingbirdTestsHost/Module"
    ),
    .target(
      name: "MockingbirdPerformanceTestsHost",
      dependencies: [],
      path: "MockingbirdTestsHost/Performance"
    ),
    .testTarget(
      name: "MockingbirdTests",
      dependencies: [
        "Mockingbird",
        "MockingbirdGenerator",
        "MockingbirdTestsHost",
        "MockingbirdPerformanceTestsHost",
      ],
      path: "MockingbirdTests"
    )
  ]
)
