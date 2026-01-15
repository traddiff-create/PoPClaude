// SDQuestion.kt
// PoP - People Over Party
// Shared data model for South Dakota civics questions

package com.pop.shared.models

/**
 * Represents a South Dakota-specific civics question.
 * Covers state, county (Pennington), and municipal (Rapid City) levels.
 */
data class SDQuestion(
    val id: Int,
    val question: String,
    val answer: String,
    val category: SDCategory
)

/**
 * Categories for South Dakota civics questions.
 * Organized by government level.
 */
enum class SDCategory(val displayName: String) {
    STATE("State"),
    COUNTY("County"),
    MUNICIPAL("Municipal");

    /**
     * SF Symbol name for iOS / Material icon name for Android
     */
    val icon: String
        get() = when (this) {
            STATE -> "building.columns"
            COUNTY -> "map"
            MUNICIPAL -> "building.2"
        }

    /**
     * Brand color identifier for theming
     */
    val colorName: String
        get() = when (this) {
            STATE -> "popBlue"
            COUNTY -> "popGold"
            MUNICIPAL -> "popDarkBlue"
        }
}
