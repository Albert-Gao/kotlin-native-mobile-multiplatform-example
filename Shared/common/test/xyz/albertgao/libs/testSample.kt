package xyz.albertgao.libs

import kotlin.test.*

class AuthTest {
    @Test
    fun testCheckPlatform() {
        val sample = Sample()
        val platform = sample.checkPlatform()
        assertEquals(true, platform.endsWith("google.com"))
    }
}
