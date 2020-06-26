# mfNotification

[![Version](https://img.shields.io/cocoapods/v/mfNotification.svg?style=flat)](https://cocoapods.org/pods/mfNotification)
[![License](https://img.shields.io/cocoapods/l/mfNotification.svg?style=flat)](https://cocoapods.org/pods/mfNotification)
[![Platform](https://img.shields.io/cocoapods/p/mfNotification.svg?style=flat)](https://cocoapods.org/pods/mfNotification)


<p align="center">
  <img src="https://s7.gifyu.com/images/mfNotification.png" width="30%" />
</p>


## Description

mfNotification is an in-app notification view that allows you to easily display notification anywhere on your app.

## Installation

mfNotification is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'mfNotification'
```
## Usage

```swift
import UIKit
import mfNotification

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func simulatePressed(_ sender: Any) {
        let notification = mfNotification()
        notification.present(title: "Title", text: "This is Text")
    }
}
```

It can also be used to add delegate and further customize in this way

```swift
import UIKit
import mfNotification

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func simulatePressed(_ sender: Any) {
        let notification = mfNotification()
        
        //set attributes
        var myAttributes = mfNotificationAttributes()
        myAttributes.textColor = .black //and other attributes ...
        notification.attributes = myAttributes
        
        //set delegate
        notification.delegate = self
        
        //set custom duration
        notification.duration = 4.0
        
        //turn on/off soundAlert
        notification.soundAlert = true
        
        //present notification
        notification.present(title: "Title", text: "This is Text", avatar: UIImage(named: "Image"), info: "This is info")
    }
}

extension ViewController: mfNotificationDelegate {
    func mfNotificationClicked(info: Any?) {
        print(info)
    }
    
    func mfNotificationWillDismiss() {
        
    }
    
    func mfNotificationDidDismiss() {
        
    }
}
```
## Author

Mohammad Firouzi, mohammad.spz@icloud.com

## License

mfNotification is available under the MIT license. See the LICENSE file for more info.
