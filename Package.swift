// swift-tools-version:4.1
//
// Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.

import PackageDescription

let package = Package(
    name: "ServiceModelSwiftCodeGenerate",
    products: [
        .library(
            name: "ServiceModelCodeGeneration",
            targets: ["ServiceModelCodeGeneration"]),
        .library(
            name: "ServiceModelEntities",
            targets: ["ServiceModelEntities"]),
        .library(
            name: "ServiceModelGenerate",
            targets: ["ServiceModelGenerate"]),
        .library(
            name: "SwaggerServiceModel",
            targets: ["SwaggerServiceModel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tachyonics/SwaggerParser.git", from: "0.6.3"), 
        .package(url: "https://github.com/jpsim/Yams.git", from: "0.5.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ServiceModelCodeGeneration",
            dependencies: ["ServiceModelEntities"]),
        .target(
            name: "ServiceModelEntities",
            dependencies: []),
        .target(
            name: "SwaggerServiceModel",
            dependencies: ["ServiceModelCodeGeneration", "Yams", "SwaggerParser"]),
        .target(
            name: "ServiceModelGenerate",
            dependencies: ["SwaggerServiceModel"]),
        .testTarget(
            name: "ServiceModelEntitiesTests",
            dependencies: ["ServiceModelEntities"]),
    ]
)
