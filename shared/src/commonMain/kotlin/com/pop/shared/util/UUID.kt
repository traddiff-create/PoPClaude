// UUID.kt
// PoP - People Over Party
// Platform-agnostic UUID generation (expect/actual pattern)

package com.pop.shared.util

/**
 * Generates a random UUID string.
 * Implementation is platform-specific (actual declarations in androidMain/iosMain).
 */
expect fun randomUUID(): String
