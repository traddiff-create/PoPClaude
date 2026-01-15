// LearnScreen.kt
// PoP - People Over Party
// USCIS Civics Flashcard Screen

package com.pop.android.ui.screens

import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.pop.shared.data.CivicsData
import com.pop.shared.models.CivicsCategory
import com.pop.shared.models.CivicsQuestion

/**
 * Learn Screen - USCIS Civics Flashcard Interface
 * Displays 100 civics questions in flashcard format.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LearnScreen() {
    var selectedCategory by remember { mutableStateOf<CivicsCategory?>(null) }
    var currentIndex by remember { mutableIntStateOf(0) }
    var isFlipped by remember { mutableStateOf(false) }
    var questions by remember { mutableStateOf(CivicsData.questions) }

    // Filter questions based on selected category
    val filteredQuestions = remember(selectedCategory, questions) {
        if (selectedCategory != null) {
            questions.filter { it.category == selectedCategory }
        } else {
            questions
        }
    }

    // Reset index when category changes
    LaunchedEffect(selectedCategory) {
        currentIndex = 0
        isFlipped = false
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Learn Civics") },
                actions = {
                    IconButton(onClick = {
                        questions = CivicsData.shuffledQuestions()
                        currentIndex = 0
                        isFlipped = false
                    }) {
                        Icon(Icons.Default.Shuffle, contentDescription = "Shuffle")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Category Filter Chips
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                item {
                    FilterChip(
                        selected = selectedCategory == null,
                        onClick = { selectedCategory = null },
                        label = { Text("All") }
                    )
                }
                items(CivicsCategory.entries) { category ->
                    FilterChip(
                        selected = selectedCategory == category,
                        onClick = { selectedCategory = category },
                        label = { Text(category.displayName) }
                    )
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Progress Indicator
            Text(
                text = "${currentIndex + 1} / ${filteredQuestions.size}",
                style = MaterialTheme.typography.labelLarge,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            LinearProgressIndicator(
                progress = { (currentIndex + 1).toFloat() / filteredQuestions.size },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 8.dp)
            )

            Spacer(modifier = Modifier.height(24.dp))

            // Flashcard
            if (filteredQuestions.isNotEmpty()) {
                FlashCard(
                    question = filteredQuestions[currentIndex],
                    isFlipped = isFlipped,
                    onFlip = { isFlipped = !isFlipped },
                    modifier = Modifier.weight(1f)
                )
            }

            Spacer(modifier = Modifier.height(24.dp))

            // Navigation Buttons
            Row(
                horizontalArrangement = Arrangement.spacedBy(16.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                OutlinedButton(
                    onClick = {
                        if (currentIndex > 0) {
                            currentIndex--
                            isFlipped = false
                        }
                    },
                    enabled = currentIndex > 0,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.ArrowBack, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Previous")
                }

                Button(
                    onClick = {
                        if (currentIndex < filteredQuestions.size - 1) {
                            currentIndex++
                            isFlipped = false
                        }
                    },
                    enabled = currentIndex < filteredQuestions.size - 1,
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Next")
                    Spacer(modifier = Modifier.width(8.dp))
                    Icon(Icons.Default.ArrowForward, contentDescription = null)
                }
            }
        }
    }
}

/**
 * Flashcard component with flip animation
 */
@Composable
fun FlashCard(
    question: CivicsQuestion,
    isFlipped: Boolean,
    onFlip: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable { onFlip() },
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(24.dp),
            contentAlignment = Alignment.Center
        ) {
            AnimatedContent(
                targetState = isFlipped,
                transitionSpec = {
                    fadeIn() togetherWith fadeOut()
                },
                label = "flashcard_flip"
            ) { flipped ->
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center
                ) {
                    // Category chip
                    AssistChip(
                        onClick = { },
                        label = { Text(question.category.displayName) },
                        modifier = Modifier.padding(bottom = 16.dp)
                    )

                    if (!flipped) {
                        // Question side
                        Text(
                            text = question.question,
                            style = MaterialTheme.typography.headlineSmall,
                            textAlign = TextAlign.Center
                        )
                        Spacer(modifier = Modifier.height(24.dp))
                        Text(
                            text = "Tap to reveal answer",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    } else {
                        // Answer side
                        Text(
                            text = "Answer",
                            style = MaterialTheme.typography.labelLarge,
                            color = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = question.answer,
                            style = MaterialTheme.typography.headlineSmall,
                            textAlign = TextAlign.Center,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            }
        }
    }
}
