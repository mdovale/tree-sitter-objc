// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TreeSitterObjc",
    products: [
        .library(name: "TreeSitterObjc", targets: ["TreeSitterObjc"]),
    ],
    dependencies: [
        .package(name: "SwiftTreeSitter", url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.9.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterObjc",
            dependencies: [],
            path: ".",
            exclude: [
                "binding.gyp",
                "bindings/c",
                "bindings/go",
                "bindings/node",
                "bindings/python",
                "bindings/rust",
                "Cargo.toml",
                "Cargo.lock",
                "CMakeLists.txt",
                "eslint.config.mjs",
                "go.mod",
                "go.sum",
                "grammar.js",
                "LICENSE",
                "Makefile",
                "package-lock.json",
                "package.json",
                "pyproject.toml",
                "README.md",
                "setup.py",
                "src/grammar.json",
                "src/node-types.json",
                "test",
                "tree-sitter.json",
            ],
            sources: [
                "src/parser.c",
            ],
            resources: [
                .copy("queries"),
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")],
        ),
        .testTarget(
            name: "TreeSitterObjcTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterObjc",
            ],
            path: "bindings/swift/TreeSitterObjcTests",
        ),
    ],
    cLanguageStandard: .c11,
)
