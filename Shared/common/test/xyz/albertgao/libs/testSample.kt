package xyz.albertgao.libs

import kotlin.test.*

class AuthTest {
    @Test
    fun testCheckPlatform() {
        val auth = Sample()
        val platform = auth.checkPlatform()
        assertEquals(true, platform.endsWith("google.com"))
    }
}
