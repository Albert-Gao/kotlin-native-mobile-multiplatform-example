package xyz.albertgao.libs

expect class Platform(
  url: String
) {
  fun get():String
}