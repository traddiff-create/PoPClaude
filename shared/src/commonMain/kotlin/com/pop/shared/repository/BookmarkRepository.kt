// BookmarkRepository.kt
// PoP - People Over Party
// Repository interface for document bookmark persistence

package com.pop.shared.repository

/**
 * Repository interface for document bookmarks.
 * Allows users to save their favorite documents/sections.
 */
interface BookmarkRepository {
    /**
     * Get all bookmarked document IDs
     */
    suspend fun getBookmarkedIds(): Set<String>

    /**
     * Check if a document is bookmarked
     */
    suspend fun isBookmarked(documentId: String): Boolean

    /**
     * Toggle bookmark status for a document
     */
    suspend fun toggleBookmark(documentId: String, title: String)

    /**
     * Add a bookmark
     */
    suspend fun addBookmark(documentId: String, title: String)

    /**
     * Remove a bookmark
     */
    suspend fun removeBookmark(documentId: String)

    /**
     * Clear all bookmarks
     */
    suspend fun clearAllBookmarks()
}
