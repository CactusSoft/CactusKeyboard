# CactusKeyboard

CactusKeyboard is a usless helper for keyboard observing. It uses system notifications and have UIViewController extension functions, so you don't need to restructure your project, just use extension functions.

## Usage
Import CactusKeyboard in the file:

```ruby
import CactusKeyboard
```

Then set localized variants of your strings as follows:

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardObserver { [weak self] (visible, height) in
            guard let `self` = self else { return }
            print("\(self) keyboard visible: \(visible) height:\(height)")
        }
    }
    
    deinit {
        removeKeyboardObserver()
    }
```

## Installation

CactusLocalization is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CactusKeyboard'
```

## Author

MaksimVialykh, maxim.vialykh@cactussoft.biz

## License

CactusKeyboard is available under the MIT license. See the LICENSE file for more info.
