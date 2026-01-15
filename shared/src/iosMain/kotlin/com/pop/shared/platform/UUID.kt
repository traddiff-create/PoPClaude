// UUID.kt (iOS actual implementation)
// PoP - People Over Party

package com.pop.shared.util

import platform.Foundation.NSUUID

/**
 * iOS implementation of UUID generation using Foundation's NSUUID
 */
actual fun randomUUID(): String = NSUUID().UUIDString()
