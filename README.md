# GBKTextField

Text field that allows displaying custom or using default error.

![GBKTextField](http://gbksoft.net/downloads/popravka-dv/GBKTextField.png)

## Features

- [x] Errors display, for instance, to display validation errors texts.
- [x] Ability to display default or custom errors.
- [x] Ability to add text either with storyboard or a code. Storyboard's texts will be a default.

## Requirements

- iOS 9.0+

## Installation

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate `GBKTextField` into your Xcode project using `CocoaPods`, specify it in your `Podfile`:

```ruby
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'GBKTextField', :git => 'git@github.com:gbksoft/MaterialTextField-ios.git'
end
```

Then, run the following command:

```bash
$ pod install
```

### Setup

Install `GBKTextField` class for required `UITextField` into the storyboard:

![GBKTextField_setup_class](http://gbksoft.net/downloads/popravka-dv/GBKTextField_setup_class.png)

There are specific properties that allow setting error text and default display type:

![GBKTextField_setup_property](http://gbksoft.net/downloads/popravka-dv/GBKTextField_setup_property.png)

Import framework into `UIViewController`:

```swift
import GBKTextField
```

Display an error:

```swift
email.showError(text: "Email format is not valid. Try username@example.com.")
password.showError() // to be displayed from a storyboard
```

Hide:

```swift
email.hideError()
password.hideError()
```

In order to create a custom display, a user has to implement `GBKTextFieldErrorViewProtocol` protocol into a specific `UIView`:

```swift
protocol GBKTextFieldErrorViewProtocol {
    func update(text: String?)
}
```

Call `setup` method in `GBKTextField` class and pass `<UIView & GBKTextFieldErrorViewProtocol>` parameter:

```swift
email.setup(errorView: <UIView & GBKTextFieldErrorViewProtocol>)
```

# Let us know
We'd be very happy if you sent links to your projects where you use our component. Just send us email to [github@gbksoft.com](mailto:github@gbksoft.com)