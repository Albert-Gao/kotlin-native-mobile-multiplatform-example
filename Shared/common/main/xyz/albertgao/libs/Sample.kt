package xyz.albertgao.libs

class Sample {
  fun checkPlatform():String {
    val platform = Platform("google.com")
    return platform.get()
  }
}