// build.gradle.kts (Root)
// PoP - People Over Party
// Kotlin Multiplatform Root Build Configuration

plugins {
    // Kotlin Multiplatform
    kotlin("multiplatform") version "1.9.21" apply false
    kotlin("android") version "1.9.21" apply false

    // Android
    id("com.android.application") version "8.2.0" apply false
    id("com.android.library") version "8.2.0" apply false

    // Compose Multiplatform
    id("org.jetbrains.compose") version "1.5.11" apply false

    // Room (for Android persistence)
    id("com.google.devtools.ksp") version "1.9.21-1.0.15" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

tasks.register("clean", Delete::class) {
    delete(rootProject.layout.buildDirectory)
}
