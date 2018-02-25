package xyz.albertgao.libs

import kotlin.test.*

class HttpTest {
    @Test
    fun testGetPlatform() {
        val platform = Platform("ABC")
        assertEquals("KN-Android ABC", platform.get())
    }
}
