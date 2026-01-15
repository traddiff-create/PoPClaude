// FlashcardProgressRepository.kt
// PoP - People Over Party
// Repository interface for flashcard progress persistence

package com.pop.shared.repository

import com.pop.shared.models.FlashcardProgress
import com.pop.shared.models.ProgressStats

/**
 * Repository interface for flashcard learning progress.
 * Platform-specific implementations handle actual persistence
 * (Core Data on iOS, Room on Android).
 */
interface FlashcardProgressRepository {
    /**
     * Get all question IDs that user has marked as "known"
     */
    suspend fun getKnownQuestionIds(): Set<Int>

    /**
     * Get all question IDs that user has viewed at least once
     */
    suspend fun getViewedQuestionIds(): Set<Int>

    /**
     * Mark a question as viewed and increment view count
     */
    suspend fun markViewed(questionId: Int)

    /**
     * Toggle the "known" status for a question
     */
    suspend fun toggleKnown(questionId: Int)

    /**
     * Check if a specific question is marked as known
     */
    suspend fun isKnown(questionId: Int): Boolean

    /**
     * Get detailed progress for a specific question
     */
    suspend fun getProgress(questionId: Int): FlashcardProgress?

    /**
     * Get aggregate statistics for the question set
     */
    suspend fun getStats(totalQuestions: Int): ProgressStats

    /**
     * Reset all progress (clear all data)
     */
    suspend fun resetAllProgress()
}

/**
 * Repository for SD-specific flashcard progress.
 * Same interface, separate storage to track SD vs USCIS progress independently.
 */
interface SDFlashcardProgressRepository : FlashcardProgressRepository
