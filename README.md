# GColor - Color Management System

**KColor** is a flexible, customizable color management system for iOS applications. It helps you manage color themes and UI customization for different appearance modes (e.g., dark mode, light mode) and provides utilities for adjusting and storing color configurations.

## Features

- Dynamic color theme switching based on appearance settings
- Easy to integrate with `UINavigationController` and `UITabBarController`
- Customizable color packs with default and user-defined colors
- Provides functions for lightening, darkening, and adjusting colors based on brightness
- Color persistence using `UserDefaults`
- Built with **Clean Architecture** principles for separation of concerns

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Basic Setup](#basic-setup)
  - [Adding Custom Colors](#adding-custom-colors)
  - [Setting Colors to UI Components](#setting-colors-to-ui-components)
- [Example](#example)
- [Contributing](#contributing)
- [License](#license)

## Installation

### Requirements

- iOS 12.0+
- Swift 5.0+
- Xcode 12.0+
- UIKit

### Swift Package Manager

You can add **GColor** to your project using Swift Package Manager.

1. In Xcode, go to **File > Swift Packages > Add Package Dependency**.
2. Enter the following URL:
```  "https://github.com/mohamedaglan2225/GColorPalet.git"  ```
3. Choose the latest version and finish the installation.
Alternatively, add the following line to your `Package.swift` file:

```swift
dependencies: [
 .package(url: "https://github.com/mohamedaglan2225/GColorPalet.git", from: "1.0.0")
]

```

### Usage

```
import GColor

let colorManager = KColor.shared

```

1- To ensure default colors are set, call:

```
colorManager.createColorsPacksIfNeeded()
```


2- You can access various theme colors, for example, to set the navigation bar color:

```
let navBarColor = colorManager.navBar
let navBarTextColor = colorManager.navBarText

```

3- Adding Custom Colors

You can customize or update your color packs by calling the following method and passing your custom color packs:

```
let newColorPacks: [[UIColor]] = [
    [UIColor.red, UIColor.green, UIColor.blue, UIColor.black, UIColor.white],
    [UIColor.orange, UIColor.purple, UIColor.yellow, UIColor.cyan, UIColor.gray]
]

colorManager.colors = newColorPacks

```


4- UINavigationController Example:

```
let navController = UINavigationController()
navController.setColor(GColor.shared)

```


5- UITabBarController Example:

```
let tabBarController = UITabBarController()
tabBarController.setColor(GColor.shared)

```


### Example : 

```
import UIKit
import GColor

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GColor.shared.createColorsPacksIfNeeded()

        if let navController = window?.rootViewController as? UINavigationController {
            navController.setColor(KColor.shared)
        }

        return true
    }
}

```






