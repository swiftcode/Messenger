// swift-tools-version:3.1

import PackageDescription

let package = Package(
 name: "Messenger",
 dependencies: [
 .Package(url: “https://github.com/OpenKitten/MongoKitten.git", majorVersion: 3),
 .Package(url: “https://github.com/vapor/vapor.git", majorVersion: 1)
 ]
)
