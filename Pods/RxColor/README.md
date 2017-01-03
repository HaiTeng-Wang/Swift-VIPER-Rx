# RxColor

[![Version](https://img.shields.io/cocoapods/v/RxColor.svg?style=flat)](http://cocoapods.org/pods/RxColor)
[![License](https://img.shields.io/cocoapods/l/RxColor.svg?style=flat)](http://cocoapods.org/pods/RxColor)
[![Platform](https://img.shields.io/cocoapods/p/RxColor.svg?style=flat)](http://cocoapods.org/pods/RxColor)

`RxSwift` bindings for common `UIColor` setters.
UIView (backgroundColor), UILabel (textColor) and UIButton (titleColor and tintColor+titleColor).

## Usage

```swift
Theming.sharedInstance.accentColor
      .bindTo(commentsButton.rx_color)
      .addDisposableTo(disposeBag)
```

```swift
Theming.sharedInstance.accentColor
      .bindTo(label.rx_textColor)
      .addDisposableTo(disposeBag)
```

```swift
Theming.sharedInstance.backgroundColor
      .bindTo(label.rx_backgroundColor)
      .addDisposableTo(disposeBag)
```


## Installation

RxResult is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RxColor"
```

## License

RxResult is available under the MIT license. See the LICENSE file for more info.
