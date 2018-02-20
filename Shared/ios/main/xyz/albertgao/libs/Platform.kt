package xyz.albertgao.libs

actual class Platform actual constructor(
  private val url: String
) {
  actual fun getPlatform():String {
    return "KN-iOS $url"
  }
}