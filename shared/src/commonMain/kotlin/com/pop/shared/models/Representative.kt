// Representative.kt
// PoP - People Over Party
// Shared data model for elected representatives

package com.pop.shared.models

import com.pop.shared.util.randomUUID

/**
 * Represents an elected representative at state or federal level.
 */
data class Representative(
    val id: String = randomUUID(),
    val name: String,
    val chamber: Chamber,
    val district: Int,
    val party: Party,
    val email: String,
    val phone: String? = null,
    val hometown: String? = null,
    val photoURL: String? = null
) {
    /**
     * Display title based on chamber (Senator, Representative, etc.)
     */
    val displayTitle: String
        get() = when (chamber) {
            Chamber.SD_SENATE -> "Senator"
            Chamber.SD_HOUSE -> "Representative"
            Chamber.US_SENATE -> "U.S. Senator"
            Chamber.US_HOUSE -> "U.S. Representative"
        }

    /**
     * Formatted district display string
     */
    val districtDisplay: String
        get() = if (chamber.isFederal && chamber == Chamber.US_HOUSE) {
            "At-Large"
        } else if (chamber.isFederal) {
            ""
        } else {
            "District $district"
        }
}

/**
 * Legislative chambers (state and federal)
 */
enum class Chamber(val displayName: String) {
    SD_SENATE("SD Senate"),
    SD_HOUSE("SD House"),
    US_SENATE("US Senate"),
    US_HOUSE("US House");

    val isState: Boolean
        get() = this == SD_SENATE || this == SD_HOUSE

    val isFederal: Boolean
        get() = this == US_SENATE || this == US_HOUSE

    val icon: String
        get() = when (this) {
            SD_SENATE, US_SENATE -> "building.columns"
            SD_HOUSE, US_HOUSE -> "person.3"
        }
}

/**
 * Political party affiliation
 */
enum class Party(val abbreviation: String, val fullName: String) {
    REPUBLICAN("R", "Republican"),
    DEMOCRAT("D", "Democrat"),
    INDEPENDENT("I", "Independent");

    val colorName: String
        get() = when (this) {
            REPUBLICAN -> "red"
            DEMOCRAT -> "blue"
            INDEPENDENT -> "purple"
        }
}
