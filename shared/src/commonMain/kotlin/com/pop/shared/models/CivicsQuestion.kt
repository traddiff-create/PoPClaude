// CivicsQuestion.kt
// PoP - People Over Party
// Shared data model for USCIS civics questions

package com.pop.shared.models

/**
 * Represents a single USCIS civics test question.
 * Used for the Learn tab flashcard feature.
 */
data class CivicsQuestion(
    val id: Int,
    val question: String,
    val answer: String,
    val category: CivicsCategory
)

/**
 * Categories for USCIS civics questions.
 * Matches the official test structure.
 */
enum class CivicsCategory(val displayName: String) {
    AMERICAN_GOVERNMENT("American Government"),
    AMERICAN_HISTORY("American History"),
    INTEGRATED_CIVICS("Integrated Civics");

    /**
     * SF Symbol name for iOS / Material icon name for Android
     */
    val icon: String
        get() = when (this) {
            AMERICAN_GOVERNMENT -> "building.columns"
            AMERICAN_HISTORY -> "clock.arrow.circlepath"
            INTEGRATED_CIVICS -> "flag"
        }
}
