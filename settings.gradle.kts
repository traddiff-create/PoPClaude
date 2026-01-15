// settings.gradle.kts
// PoP - People Over Party
// Kotlin Multiplatform Project Configuration

pluginManagement {
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "PoP"

// Multiplatform modules
include(":shared")
include(":androidApp")

// Note: iOS app (iosApp) is managed separately via Xcode
// The shared module exports an iOS framework that Xcode links against
