// CivicsDataTest.kt
// PoP - People Over Party
// Unit tests for shared civics data

package com.pop.shared

import com.pop.shared.data.CivicsData
import com.pop.shared.models.CivicsCategory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/**
 * Tests for CivicsData to ensure data integrity across platforms.
 */
class CivicsDataTest {

    @Test
    fun `should have exactly 100 questions`() {
        assertEquals(100, CivicsData.questions.size)
    }

    @Test
    fun `all questions should have unique IDs`() {
        val ids = CivicsData.questions.map { it.id }
        assertEquals(ids.size, ids.toSet().size, "All question IDs should be unique")
    }

    @Test
    fun `question IDs should be sequential from 1 to 100`() {
        val ids = CivicsData.questions.map { it.id }.sorted()
        assertEquals((1..100).toList(), ids)
    }

    @Test
    fun `should have questions in all categories`() {
        val categoriesWithQuestions = CivicsData.questions.map { it.category }.toSet()
        assertEquals(
            CivicsCategory.entries.toSet(),
            categoriesWithQuestions,
            "All categories should have at least one question"
        )
    }

    @Test
    fun `questionsByCategory should filter correctly`() {
        CivicsCategory.entries.forEach { category ->
            val filtered = CivicsData.questionsByCategory(category)
            assertTrue(
                filtered.all { it.category == category },
                "All questions should match the filtered category"
            )
        }
    }

    @Test
    fun `shuffledQuestions should return all questions`() {
        val shuffled = CivicsData.shuffledQuestions()
        assertEquals(100, shuffled.size, "Shuffled list should have same count")
        assertEquals(
            CivicsData.questions.toSet(),
            shuffled.toSet(),
            "Shuffled list should contain same questions"
        )
    }

    @Test
    fun `randomQuestion should return a valid question`() {
        val random = CivicsData.randomQuestion()
        assertNotNull(random)
        assertTrue(random.id in 1..100)
    }

    @Test
    fun `questionById should find existing questions`() {
        val question = CivicsData.questionById(1)
        assertNotNull(question)
        assertEquals("What is the supreme law of the land?", question.question)
    }

    @Test
    fun `questionById should return null for non-existent ID`() {
        val question = CivicsData.questionById(999)
        assertEquals(null, question)
    }

    @Test
    fun `no question should have empty content`() {
        CivicsData.questions.forEach { question ->
            assertTrue(question.question.isNotBlank(), "Question ${question.id} should not be blank")
            assertTrue(question.answer.isNotBlank(), "Answer for ${question.id} should not be blank")
        }
    }

    @Test
    fun `category counts should sum to 100`() {
        val totalFromCounts = CivicsData.categoryCounts.values.sum()
        assertEquals(100, totalFromCounts)
    }
}
