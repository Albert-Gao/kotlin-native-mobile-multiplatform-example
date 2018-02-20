package xyz.albertgao.libs

class Sample {
  fun checkPlatform():String {
    val platform = Platform("google.com1")
    return platform.get()
  }
}