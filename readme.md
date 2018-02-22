# Kotlin Native mobile multiplatform example

Read my [blog](http://www.albertgao.xyz/2018/02/22/use-kotlin-to-share-native-code-between-ios-and-android/) if you want more details:

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

> In fact, you can edit the sharing code in android studio as well, as we embed them as module, and they all use the same language.

## About the example

- `Sample` class is for code that is sharing across platforms (Which means you only use API from `kotlin-stdlib-common` or some other cross platform lib).
- `Platform` class is a class which has been implemented twice for different platforms for showing the platform API case.

- Open `Android` folder in Android Studio, run the app, it will show a string from the `:shared-android`
- Open `iOS` folder in XCode, run the app, it will show a string from the `:shared-ios`
- And the string is from both platforms are retrieved from the `Sample` class.

## Tips

If you think the XCode building phase is slow. That is because it will build the KN generated iOS framework every time. You can modify it by just copying the framework files without building it. Because you can always edit Kotlin native code somewhere else.