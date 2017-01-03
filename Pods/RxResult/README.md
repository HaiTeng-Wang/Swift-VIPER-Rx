RxResult
=====

[![Version](https://img.shields.io/cocoapods/v/RxResult.svg?style=flat)](http://cocoapods.org/pods/RxResult)
[![License](https://img.shields.io/cocoapods/l/RxResult.svg?style=flat)](http://cocoapods.org/pods/RxResult)
[![Platform](https://img.shields.io/cocoapods/p/RxResult.svg?style=flat)](http://cocoapods.org/pods/RxResult)

RxResult provides helpful methods to manage `Observable` RxSwift streams with `Result` values. Allowing you to subscribe only to success or failure cases, but also calling `doOn` methods on top of it.

## Usage

```swift
let result: Observable<Result<String, JSONError>> = ...
result.doOnSuccess { value in
  print("success with \(value)")
}.doOnFailure { error in
  print("failure with \(error)")
}.subscribeSuccess { value in  // or subscribeFailure
  print("subscribed with success \(value)")
}.addDisposableTo(disposeBag)
```
## Requirements

## Installation

RxResult is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RxResult"
```

## License

RxResult is available under the MIT license. See the LICENSE file for more info.
