// UUID.kt (Android actual implementation)
// PoP - People Over Party

package com.pop.shared.util

import java.util.UUID

/**
 * Android implementation of UUID generation using java.util.UUID
 */
actual fun randomUUID(): String = UUID.randomUUID().toString()
