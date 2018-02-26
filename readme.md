# Kotlin Native mobile multiplatform example

There is a cross more platforms version (added JVM and JS) in this [repo](https://github.com/Albert-Gao/kotlin-multuplatform-including-mobile)

Read my [blog](http://www.albertgao.xyz/2018/02/22/use-kotlin-to-share-native-code-between-ios-and-android/) if you want more details:

## Overview

This is an example of using Kotlin native to share the code between iOS and Android. It contains the tests for all the platform code. Setup via the support from multiplatform kotlin.

This setup is aiming to solve the problem, where we want to write the platform specific code in a `multiplatform` manner.

## Folders

- android: Android project built by Android Studio
- ios: iOS Project built by XCode
- common: Kotlin code that is meant to be across platform across all platforms without any change.
- platforms: platform specific API which will then be compiled with `common`
    - android: Some platform specific code for android, which will be included in the android folder
    - ios: Some platform specific code for iOS, it will be compiled as an iOS framework
    
## Workflow:

- Work on Android App: Open `android` folder in Android Studio
- Work on iOS App: Open `ios` folder in XCode
- Work on sharing code: Open the root folder in `IDEA` or any other IDE.

> In fact, you can edit the sharing code in android studio as well, as we embed them as module, and they all use the same language.

## About the example

- `Sample` class is for code that is sharing across platforms (Which means you only use API from `kotlin-stdlib-common` or some other cross platform lib).
- `Platform` class is a class which has been implemented twice for different platforms for showing the platform API case.

- Open `android` folder from the root in Android Studio, run the app, it will show a string from the `:platforms-android`
- Open `ios` folder from the root in XCode, run the app, it will show a string from the `:platforms-ios`
- And the string is from both platforms are retrieved from the `Sample` class.

## Tips

If you think the XCode building phase is slow. That is because it will build the KN generated iOS framework every time. You can modify it by just copying the framework files without building it. Because you can always edit Kotlin native code somewhere else.