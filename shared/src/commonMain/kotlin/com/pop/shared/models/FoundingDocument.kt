// FoundingDocument.kt
// PoP - People Over Party
// Shared data model for founding documents

package com.pop.shared.models

import com.pop.shared.util.randomUUID

/**
 * Represents a founding document (Constitution, Declaration, etc.)
 */
data class FoundingDocument(
    val id: String = randomUUID(),
    val title: String,
    val subtitle: String,
    val year: Int,
    val category: String,
    val icon: String,
    val content: String
)
