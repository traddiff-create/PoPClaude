// BrandColors.kt
// PoP - People Over Party
// Shared brand color definitions

package com.pop.shared.config

/**
 * Simple color representation for cross-platform use.
 * Can be converted to platform-specific Color types.
 *
 * @param hex RGB hex value (e.g., 0x1A7BA8)
 */
data class BrandColor(val hex: Int) {
    val red: Float get() = ((hex shr 16) and 0xFF) / 255f
    val green: Float get() = ((hex shr 8) and 0xFF) / 255f
    val blue: Float get() = (hex and 0xFF) / 255f

    val hexString: String get() = "#${hex.toString(16).padStart(6, '0').uppercase()}"
}

/**
 * PoP brand colors from Better Together logo.
 * These colors are used consistently across iOS and Android.
 */
object BrandColors {
    // Primary brand colors
    val popBlue = BrandColor(0x1A7BA8)        // Deep teal
    val popGold = BrandColor(0xE8A832)        // Warm golden yellow
    val popDarkBlue = BrandColor(0x0D3D54)    // Dark navy

    // Background colors
    val lightBackground = BrandColor(0xF5F5F5) // Light gray
    val darkBackground = BrandColor(0x111D26)  // Dark navy

    // Semantic aliases
    val primary = popBlue
    val accent = popGold
    val secondary = popDarkBlue

    // State colors
    val success = BrandColor(0x4CAF50)
    val error = BrandColor(0xF44336)
    val warning = BrandColor(0xFF9800)
}
