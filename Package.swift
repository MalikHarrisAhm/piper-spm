// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "piper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "piper",
            targets: ["piper"])
    ],
    dependencies: [
        .package(url: "https://github.com/IhorShevchuk/espeak-ng-spm",
                 "2023.9.13"..."2023.9.13"),
        .package(url: "https://github.com/IhorShevchuk/fmt-spm",
                 .upToNextMajor(from: "10.2.1")),
        .package(url: "https://github.com/IhorShevchuk/spdlog-spm",
                 .upToNextMajor(from: "1.13.0")),
        .package(url: "https://github.com/IhorShevchuk/piper-phonemize-spm",
                 .upToNextMajor(from: "2023.11.14")),
    ],
    targets: [
        .target(name: "piper",
                dependencies: [
                    .product(name: "libespeak-ng", package: "espeak-ng-spm"),
                    .product(name: "fmt", package: "fmt-spm"),
                    .product(name: "spdlog", package: "spdlog-spm"),
                    .product(name: "piper_phonemize", package: "piper-phonemize-spm"),
                ],
                path: "",
                sources: [
                    "piper/src/cpp/piper.cpp"
                ],
                publicHeadersPath: "piper/src/cpp"
               )
    ],
    cxxLanguageStandard: .cxx17
)
