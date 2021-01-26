# KeychainManager

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) [![License](https://img.shields.io/cocoapods/l/KeychainSwift.svg?style=flat)](http://cocoadocs.org/docsets/KeychainSwift) 

This library allows you simply and fast deal with Keychain.

## Usage
Add import KeychainManager to your source code.

#### Save values

Since the library uses Generic types, you can pass as a parameter any values that are signed under the Codable protocol.

##### Exemples:

All functions above return Bool value as a result.

String:

```Swift
KeychainManager.save(value: "SuperSecretInfo", key: "SomeSecretKey")
```
Int:

```Swift
KeychainManager.save(value: 2021, key: "Year")
```
Bool:

```Swift
KeychainManager.save(value: true, key: "Status")
```
Custom Types:

```Swift
class BearerResponse: Codable {
    var accesToken: String?
    var refreshToken: String?
}

let bearer = BearerResponse()
bearer.accesToken = "some-acces-token"
bearer.refreshToken = "some-refresh-token"

KeychainManager.save(value: bearer, key: "tokenData")
```
###### Use completions:

```Swift
 KeychainManager.save(value: "Info", key: "key") {
        // succes
} failure: status in 
       // failure
}
```

#### Get values

Library provides two types of "get" functions.

##### Examples:

In this case, you need to cast the type of the function result yourself.

```Swift
let someText = KeychainManager.get(forKey: "SomeSecretKey") as? String
```
or
```Swift
KeychainManager.get(forKey: "SomeSecretKey") { (obj) in
       // succes, type of obj == Any?
} failure: {
       // failure 
 }
 ```

And the second function accepts the type of object in parameters.

```Swift
let someInt = KeychainManager.get(forKey: "Year", asType: Int.self) // return Int?
```
or
```Swift
KeychainManager.get(forKey: "Year ", asType: Int.self) { (obj) in
       // succes , type of obj == Int?
} failure: {
       // failure
}
```

#### Update values

Returns Bool as result.

```Swift
KeychainManager.update(value: "2077", forKey: "Year")
```
or 
```Swift
KeychainManager.update(value: "2077", forKey: "Year") {
        // succes
} failure: { status in
       // failure
}
```
#### Remove values

```Swift
KeychainManager.erase(key: "Year")
```
or 
```Swift
KeychainManager.erase(key: "Year") {
       // succes
 } failure: { status in
      // failure
 }
 ```
##### To remove all Keychain info use:

```Swift
KeychainManager.eraseAll()
```
## Installation

#### Swift Package Manager
You can use [Swift Package Manager](https://swift.org/package-manager/) to install KeychainManager using Xcode:

1. Open your project in Xcode
2. Click "File" -> "Swift Packages" -> "Add Package Dependency..."
3. Paste the following URL: https://github.com/Echobird/KeychainManager
4. Click "Next" -> "Next" -> "Finish"

## TODO:

1. Deal with Advanced Mode
2. Allow Installation via CocoaPods, Carthage 
3. Some small refactor
