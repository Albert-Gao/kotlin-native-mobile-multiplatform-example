package xyz.albertgao.libs

import kotlin.test.*

class HttpTest {
    @Test
    fun testGetPlatform() {
        val platform = Platform("DEF")
        assertEquals("KN-iOS DEF", platform.get())
    }
}
