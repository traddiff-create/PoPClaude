// FlashcardProgress.kt
// PoP - People Over Party
// Shared data model for tracking flashcard learning progress

package com.pop.shared.models

/**
 * Tracks user progress on individual flashcard questions.
 * Used for both USCIS and SD civics questions.
 */
data class FlashcardProgress(
    val questionId: Int,
    val timesViewed: Int = 0,
    val lastViewed: Long? = null, // Unix timestamp in milliseconds
    val isMarkedKnown: Boolean = false
)

/**
 * Aggregate progress statistics for a question set.
 */
data class ProgressStats(
    val totalQuestions: Int,
    val viewedCount: Int,
    val knownCount: Int
) {
    val viewedPercentage: Float
        get() = if (totalQuestions > 0) viewedCount.toFloat() / totalQuestions else 0f

    val knownPercentage: Float
        get() = if (totalQuestions > 0) knownCount.toFloat() / totalQuestions else 0f
}
