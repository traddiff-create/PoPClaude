// PopNavHost.kt
// PoP - People Over Party
// Navigation setup with bottom navigation bar

package com.pop.android.navigation

import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.NavGraph.Companion.findStartDestination
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.pop.android.ui.screens.*

/**
 * Navigation destinations matching iOS tabs
 */
sealed class Screen(
    val route: String,
    val title: String,
    val selectedIcon: ImageVector,
    val unselectedIcon: ImageVector
) {
    data object Learn : Screen(
        route = "learn",
        title = "Learn",
        selectedIcon = Icons.Filled.School,
        unselectedIcon = Icons.Outlined.School
    )

    data object SouthDakota : Screen(
        route = "south_dakota",
        title = "South Dakota",
        selectedIcon = Icons.Filled.AccountBalance,
        unselectedIcon = Icons.Outlined.AccountBalance
    )

    data object Documents : Screen(
        route = "documents",
        title = "Documents",
        selectedIcon = Icons.Filled.Description,
        unselectedIcon = Icons.Outlined.Description
    )

    data object Vote : Screen(
        route = "vote",
        title = "Vote",
        selectedIcon = Icons.Filled.HowToVote,
        unselectedIcon = Icons.Outlined.HowToVote
    )

    data object Connect : Screen(
        route = "connect",
        title = "Connect",
        selectedIcon = Icons.Filled.People,
        unselectedIcon = Icons.Outlined.People
    )

    data object About : Screen(
        route = "about",
        title = "About",
        selectedIcon = Icons.Filled.Info,
        unselectedIcon = Icons.Outlined.Info
    )
}

/**
 * List of bottom navigation items
 */
val bottomNavItems = listOf(
    Screen.Learn,
    Screen.SouthDakota,
    Screen.Documents,
    Screen.Vote,
    Screen.Connect,
    Screen.About
)

/**
 * Main navigation host with bottom navigation bar.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PopNavHost() {
    val navController = rememberNavController()
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

    Scaffold(
        bottomBar = {
            NavigationBar {
                bottomNavItems.forEach { screen ->
                    val selected = currentDestination?.hierarchy?.any {
                        it.route == screen.route
                    } == true

                    NavigationBarItem(
                        icon = {
                            Icon(
                                imageVector = if (selected) screen.selectedIcon else screen.unselectedIcon,
                                contentDescription = screen.title
                            )
                        },
                        label = { Text(screen.title) },
                        selected = selected,
                        onClick = {
                            navController.navigate(screen.route) {
                                // Pop up to the start destination to avoid building up a large stack
                                popUpTo(navController.graph.findStartDestination().id) {
                                    saveState = true
                                }
                                // Avoid multiple copies of the same destination
                                launchSingleTop = true
                                // Restore state when reselecting a previously selected item
                                restoreState = true
                            }
                        }
                    )
                }
            }
        }
    ) { innerPadding ->
        NavHost(
            navController = navController,
            startDestination = Screen.Learn.route,
            modifier = Modifier.padding(innerPadding)
        ) {
            composable(Screen.Learn.route) {
                LearnScreen()
            }
            composable(Screen.SouthDakota.route) {
                SouthDakotaScreen()
            }
            composable(Screen.Documents.route) {
                DocumentsScreen()
            }
            composable(Screen.Vote.route) {
                VoteScreen()
            }
            composable(Screen.Connect.route) {
                ConnectScreen()
            }
            composable(Screen.About.route) {
                AboutScreen()
            }
        }
    }
}
