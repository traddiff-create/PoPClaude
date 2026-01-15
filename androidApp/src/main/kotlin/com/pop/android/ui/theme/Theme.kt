// Theme.kt
// PoP - People Over Party
// Material 3 Theme using shared brand colors

package com.pop.android.ui.theme

import android.app.Activity
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat
import com.pop.shared.config.BrandColors

// Convert shared brand colors to Compose colors
val PopBlue = Color(BrandColors.popBlue.hex.toLong() or 0xFF000000)
val PopGold = Color(BrandColors.popGold.hex.toLong() or 0xFF000000)
val PopDarkBlue = Color(BrandColors.popDarkBlue.hex.toLong() or 0xFF000000)
val PopLightBackground = Color(BrandColors.lightBackground.hex.toLong() or 0xFF000000)
val PopDarkBackground = Color(BrandColors.darkBackground.hex.toLong() or 0xFF000000)

/**
 * Light color scheme using PoP brand colors
 */
private val LightColorScheme = lightColorScheme(
    primary = PopBlue,
    onPrimary = Color.White,
    primaryContainer = PopBlue.copy(alpha = 0.1f),
    onPrimaryContainer = PopDarkBlue,

    secondary = PopGold,
    onSecondary = PopDarkBlue,
    secondaryContainer = PopGold.copy(alpha = 0.2f),
    onSecondaryContainer = PopDarkBlue,

    tertiary = PopDarkBlue,
    onTertiary = Color.White,

    background = PopLightBackground,
    onBackground = PopDarkBlue,

    surface = Color.White,
    onSurface = PopDarkBlue,

    surfaceVariant = Color(0xFFE7E0EC),
    onSurfaceVariant = Color(0xFF49454F),

    outline = Color(0xFF79747E)
)

/**
 * Dark color scheme using PoP brand colors
 */
private val DarkColorScheme = darkColorScheme(
    primary = PopBlue,
    onPrimary = Color.White,
    primaryContainer = PopBlue.copy(alpha = 0.3f),
    onPrimaryContainer = Color.White,

    secondary = PopGold,
    onSecondary = PopDarkBlue,
    secondaryContainer = PopGold.copy(alpha = 0.3f),
    onSecondaryContainer = Color.White,

    tertiary = PopGold,
    onTertiary = PopDarkBlue,

    background = PopDarkBackground,
    onBackground = Color.White,

    surface = Color(0xFF1E1E1E),
    onSurface = Color.White,

    surfaceVariant = Color(0xFF49454F),
    onSurfaceVariant = Color(0xFFCAC4D0),

    outline = Color(0xFF938F99)
)

/**
 * PoP Theme - wraps Material 3 theme with brand colors.
 */
@Composable
fun PopTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit
) {
    val colorScheme = if (darkTheme) DarkColorScheme else LightColorScheme

    val view = LocalView.current
    if (!view.isInEditMode) {
        SideEffect {
            val window = (view.context as Activity).window
            window.statusBarColor = colorScheme.primary.toArgb()
            WindowCompat.getInsetsController(window, view).isAppearanceLightStatusBars = !darkTheme
        }
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = PopTypography,
        content = content
    )
}
