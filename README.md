# DMSansFontPackage

A Swift package for using DM Sans fonts in SwiftUI projects.

## Installation

Add this package to your project via Swift Package Manager.

## Usage

1. Register fonts in your app's initialization:

```swift
import DMSansFontPackage

@main
struct MyApp: App {
    init() {
        DMSansFontPackage.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
