# libwebp + Xcode

A wrapper for [libwebp](https://github.com/webmproject/libwebp) + Xcode project.
This enables Carthage support
This also contains the Swift Package Manager support

[![CI Status](http://img.shields.io/travis/SDWebImage/libwebp-Xcode.svg?style=flat)](https://travis-ci.org/SDWebImage/libwebp-Xcode)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/SDWebImage/libwebp-Xcode)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)

## Requirements

+ iOS 8
+ macOS 10.10
+ tvOS 9.0
+ watchOS 2.0

## Installation

#### CocoaPods

libwebp is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'libwebp'
```

### Carthage

libwebp is (via this repo) available through [Carthage](https://github.com/Carthage/Carthage).

```
github "SDWebImage/libwebp-Xcode"
```

### SwiftPM

Libwebp is available through [Swift Package Manager](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg).

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/SDWebImage/libwebp-Xcode", from: "1.1.0")
    ],
    // ...
)
```

## Usage

Use libwebp as you would normally, this is just a repo that adds an Xcode proj.

For Swift Package Manager user, it's recommended to use the modular import instead of C headers.

+ Objective-C

```objective-c
@import libwebp;
// or if you don't use module
#import <webp/decode.h>
#import <webp/encode.h>
```

+ Swift

```swift
import libwebp
```

## License

libwebp is available under the BSD-3 license. See [the LICENSE file](https://github.com/webmproject/libwebp/blob/master/COPYING) for more info.


