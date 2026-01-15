// AppConfig.kt
// PoP - People Over Party
// State and organization configuration for multi-state support

package com.pop.shared.config

/**
 * Configuration for a PoP app instance.
 * This enables the app to be forked and customized for different states/organizations.
 *
 * To create a version for a different state:
 * 1. Create a new AppConfig instance with your state's details
 * 2. Update CurrentConfig.config to use your configuration
 * 3. Add state-specific civics questions
 */
data class AppConfig(
    // Organization Details
    val orgName: String,
    val orgTagline: String,
    val contactEmail: String,
    val contactPhone: String,
    val websiteURL: String,

    // State Configuration
    val stateName: String,
    val stateAbbrev: String,
    val capital: String,
    val legislatureURL: String,
    val sosElectionsURL: String,

    // County/Municipal (Optional - for localized versions)
    val primaryCounty: String? = null,
    val countyElectionsURL: String? = null,
    val municipalName: String? = null,

    // Social Media
    val instagramHandle: String? = null,
    val discordURL: String? = null,
    val newsletterEmail: String? = null,

    // Feature Flags
    val enableLegislature: Boolean = true,
    val enableEvents: Boolean = true,
    val enableContactReps: Boolean = true,
    val enableVolunteerHub: Boolean = true
) {
    companion object {
        /**
         * South Dakota configuration - the original PoP implementation.
         */
        val southDakota = AppConfig(
            orgName = "People Over Party",
            orgTagline = "Better Together",
            contactEmail = "hello@peopleoverpartysd.com",
            contactPhone = "(605) 389-3613",
            websiteURL = "https://www.peopleoverpartysd.com/",
            stateName = "South Dakota",
            stateAbbrev = "SD",
            capital = "Pierre",
            legislatureURL = "https://sdlegislature.gov/",
            sosElectionsURL = "https://sdsos.gov/elections-voting/",
            primaryCounty = "Pennington County",
            countyElectionsURL = "https://www.pennco.org/",
            municipalName = "Rapid City",
            instagramHandle = "@bettertogether_605",
            newsletterEmail = "peopleoverpartysd@gmail.com"
        )

        /**
         * Template configuration for forking to a new state.
         * Copy this and customize for your state.
         */
        val template = AppConfig(
            orgName = "[Your Organization Name]",
            orgTagline = "[Your Tagline]",
            contactEmail = "hello@yourorg.com",
            contactPhone = "(xxx) xxx-xxxx",
            websiteURL = "https://yourorg.com/",
            stateName = "[State Name]",
            stateAbbrev = "[XX]",
            capital = "[Capital City]",
            legislatureURL = "https://[state]legislature.gov/",
            sosElectionsURL = "https://sos.[state].gov/elections/",
            primaryCounty = null,
            countyElectionsURL = null,
            municipalName = null
        )
    }
}

/**
 * The active configuration for this app instance.
 * Modify this to change which state/org the app is configured for.
 */
object CurrentConfig {
    val config: AppConfig = AppConfig.southDakota
}
