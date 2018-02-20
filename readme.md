## Overview
This is an example of using Kotlin native to share the code between iOS and Android. It contains the tests for all the platform code. Setup via the support from multiplatform kotlin.

This setup is aiming to solve the problem, where we want to write the platform specific code in a `multiplatform` manner.

## Folders
- Android: Android project built by Android Studio
- iOS: iOS Project built by XCode
- Shared: Kotlin Native code which will be shared across iOS and Android

## About the shared folder
The shared code is in the `Shared` folder.
- common: The common code
- android: Some platform specific code for android, which will be included in the android folder
- ios: Some platform specific code for iOS, it will be compiled as an iOS framework

## Workflow:
- Work on Android App: Open `Android` folder in Android Studio
- Work on iOS App: Open `iOS` folder in XCode
- Work on sharing code: Open the root folder in `IDEA` or any other IDE.

## Current issues

### Android Studio (Not an issue really)
1. The Android Studio won't recognize the syntax of `expect` and `actual`. 
> Just open the `Shared` code in `IDEA` and you will be all fine.

### shared-ios
The gradle test won't run, seems the sourceSets is not right, but I already defined it in the `framework()`section.
