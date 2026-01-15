// PopApplication.kt
// PoP - People Over Party
// Android Application class

package com.pop.android

import android.app.Application

/**
 * Application class for PoP Android app.
 * Initializes dependencies and app-wide configuration.
 */
class PopApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        // Initialize any app-wide dependencies here
        // e.g., Room database, analytics, etc.
    }

    companion object {
        const val TAG = "PoP"
    }
}
