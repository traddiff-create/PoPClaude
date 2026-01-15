//
//  SouthDakotaQuestions.swift
//  PoP
//
//  South Dakota Civics Questions - State, County, and Municipal
//  Focus on Pennington County and Rapid City
//

import Foundation

struct SDQuestion: Identifiable, Equatable {
    let id: Int
    let question: String
    let answer: String
    let category: SDCategory
}

enum SDCategory: String, CaseIterable {
    case state = "State"
    case county = "County"
    case municipal = "Municipal"

    var icon: String {
        switch self {
        case .state: return "building.columns"
        case .county: return "map"
        case .municipal: return "building.2"
        }
    }

    var color: String {
        switch self {
        case .state: return "popBlue"
        case .county: return "popGold"
        case .municipal: return "popDarkBlue"
        }
    }
}

struct SouthDakotaData {
    static let questions: [SDQuestion] = [
        // ═══════════════════════════════════════════════════════════════
        // STATE LEVEL - South Dakota Government & History
        // ═══════════════════════════════════════════════════════════════

        // Statehood & Basics
        SDQuestion(id: 1, question: "When did South Dakota become a state?", answer: "November 2, 1889 (40th state)", category: .state),
        SDQuestion(id: 2, question: "What is the capital of South Dakota?", answer: "Pierre", category: .state),
        SDQuestion(id: 3, question: "What is South Dakota's state motto?", answer: "Under God the People Rule", category: .state),
        SDQuestion(id: 4, question: "What is the state nickname of South Dakota?", answer: "The Mount Rushmore State (also The Coyote State)", category: .state),
        SDQuestion(id: 5, question: "What is the state flower of South Dakota?", answer: "Pasque Flower", category: .state),
        SDQuestion(id: 6, question: "What is the state bird of South Dakota?", answer: "Ring-necked Pheasant", category: .state),
        SDQuestion(id: 7, question: "What is the state animal of South Dakota?", answer: "Coyote", category: .state),
        SDQuestion(id: 8, question: "What is the state fish of South Dakota?", answer: "Walleye", category: .state),

        // State Government Structure
        SDQuestion(id: 9, question: "What are the three branches of South Dakota state government?", answer: "Executive, Legislative, and Judicial", category: .state),
        SDQuestion(id: 10, question: "Who is the head of South Dakota's executive branch?", answer: "The Governor", category: .state),
        SDQuestion(id: 11, question: "How long is a term for South Dakota's Governor?", answer: "4 years", category: .state),
        SDQuestion(id: 12, question: "How many terms can South Dakota's Governor serve consecutively?", answer: "2 terms (8 years)", category: .state),
        SDQuestion(id: 13, question: "Who becomes Governor if the current Governor cannot serve?", answer: "The Lieutenant Governor", category: .state),
        SDQuestion(id: 14, question: "What is South Dakota's legislature called?", answer: "The South Dakota Legislature", category: .state),
        SDQuestion(id: 15, question: "What are the two chambers of South Dakota's Legislature?", answer: "Senate and House of Representatives", category: .state),
        SDQuestion(id: 16, question: "How many members are in the South Dakota Senate?", answer: "35 Senators", category: .state),
        SDQuestion(id: 17, question: "How many members are in the South Dakota House of Representatives?", answer: "70 Representatives", category: .state),
        SDQuestion(id: 18, question: "How long is a term for a South Dakota State Senator?", answer: "2 years", category: .state),
        SDQuestion(id: 19, question: "How long is a term for a South Dakota State Representative?", answer: "2 years", category: .state),
        SDQuestion(id: 20, question: "What is the highest court in South Dakota?", answer: "The South Dakota Supreme Court", category: .state),
        SDQuestion(id: 21, question: "How many justices serve on the South Dakota Supreme Court?", answer: "5 justices", category: .state),
        SDQuestion(id: 22, question: "How are South Dakota Supreme Court justices selected?", answer: "Appointed by the Governor, then face retention elections", category: .state),

        // State Constitution & Laws
        SDQuestion(id: 23, question: "When was the South Dakota Constitution adopted?", answer: "October 1, 1889", category: .state),
        SDQuestion(id: 24, question: "What is the supreme law of South Dakota?", answer: "The South Dakota Constitution", category: .state),
        SDQuestion(id: 25, question: "What is an initiated measure in South Dakota?", answer: "A law proposed directly by citizens through petition signatures", category: .state),
        SDQuestion(id: 26, question: "What is a referred law in South Dakota?", answer: "A law passed by the Legislature that is referred to voters for approval", category: .state),
        SDQuestion(id: 27, question: "What is a constitutional amendment in South Dakota?", answer: "A change to the state constitution, requiring voter approval", category: .state),
        SDQuestion(id: 28, question: "How many signatures are needed for an initiated measure in South Dakota?", answer: "5% of votes cast in the last gubernatorial election", category: .state),

        // Elections & Voting
        SDQuestion(id: 29, question: "What is the minimum age to vote in South Dakota?", answer: "18 years old", category: .state),
        SDQuestion(id: 30, question: "How long must you be a resident of South Dakota to vote?", answer: "You must reside in the precinct for at least 30 days", category: .state),
        SDQuestion(id: 31, question: "Who is South Dakota's chief elections officer?", answer: "The Secretary of State", category: .state),
        SDQuestion(id: 32, question: "When are general elections held in South Dakota?", answer: "First Tuesday after the first Monday in November", category: .state),
        SDQuestion(id: 33, question: "What is the deadline to register to vote in South Dakota?", answer: "15 days before the election", category: .state),
        SDQuestion(id: 34, question: "Can you register to vote on Election Day in South Dakota?", answer: "No, South Dakota does not have same-day voter registration", category: .state),

        // Congressional Representation
        SDQuestion(id: 35, question: "How many U.S. Senators does South Dakota have?", answer: "2 Senators", category: .state),
        SDQuestion(id: 36, question: "How many U.S. Representatives does South Dakota have?", answer: "1 Representative (at-large)", category: .state),
        SDQuestion(id: 37, question: "Why does South Dakota only have one U.S. Representative?", answer: "Due to its population size; each state gets at least one", category: .state),

        // State History
        SDQuestion(id: 38, question: "What territory was South Dakota part of before statehood?", answer: "Dakota Territory", category: .state),
        SDQuestion(id: 39, question: "What famous monument is located in South Dakota?", answer: "Mount Rushmore", category: .state),
        SDQuestion(id: 40, question: "Which four presidents are carved on Mount Rushmore?", answer: "Washington, Jefferson, Roosevelt (Theodore), and Lincoln", category: .state),
        SDQuestion(id: 41, question: "What Native American memorial is being carved in the Black Hills?", answer: "Crazy Horse Memorial", category: .state),
        SDQuestion(id: 42, question: "What major event happened at Wounded Knee in 1890?", answer: "The Wounded Knee Massacre", category: .state),
        SDQuestion(id: 43, question: "Name one Native American tribe with reservations in South Dakota.", answer: "Oglala Lakota, Rosebud Sioux, Cheyenne River Sioux, Standing Rock Sioux, Crow Creek, Lower Brule, Yankton, Flandreau Santee, or Sisseton-Wahpeton", category: .state),
        SDQuestion(id: 44, question: "What is the largest Native American reservation in South Dakota?", answer: "Pine Ridge Indian Reservation", category: .state),

        // Geography
        SDQuestion(id: 45, question: "What river forms the eastern border of South Dakota?", answer: "The Big Sioux River (Missouri River forms part of southern border)", category: .state),
        SDQuestion(id: 46, question: "What river divides South Dakota into East River and West River?", answer: "The Missouri River", category: .state),
        SDQuestion(id: 47, question: "What is the highest point in South Dakota?", answer: "Black Elk Peak (formerly Harney Peak) at 7,242 feet", category: .state),
        SDQuestion(id: 48, question: "What are the Badlands?", answer: "A rugged, eroded landscape in western South Dakota; now a National Park", category: .state),
        SDQuestion(id: 49, question: "How many counties are in South Dakota?", answer: "66 counties", category: .state),

        // ═══════════════════════════════════════════════════════════════
        // COUNTY LEVEL - Focus on Pennington County
        // ═══════════════════════════════════════════════════════════════

        SDQuestion(id: 50, question: "What is the county seat of Pennington County?", answer: "Rapid City", category: .county),
        SDQuestion(id: 51, question: "When was Pennington County established?", answer: "1875", category: .county),
        SDQuestion(id: 52, question: "Who is Pennington County named after?", answer: "John L. Pennington, Governor of Dakota Territory (1874-1878)", category: .county),
        SDQuestion(id: 53, question: "What is the governing body of Pennington County called?", answer: "Board of County Commissioners", category: .county),
        SDQuestion(id: 54, question: "How many County Commissioners does Pennington County have?", answer: "5 Commissioners", category: .county),
        SDQuestion(id: 55, question: "How long is a term for a Pennington County Commissioner?", answer: "4 years", category: .county),
        SDQuestion(id: 56, question: "What does the County Auditor do?", answer: "Manages elections, maintains records, handles property taxes, and serves as clerk for the Commission", category: .county),
        SDQuestion(id: 57, question: "What does the County Treasurer do?", answer: "Collects taxes, manages county funds, and handles motor vehicle registration", category: .county),
        SDQuestion(id: 58, question: "What does the County Sheriff do?", answer: "Provides law enforcement for unincorporated areas and the county jail", category: .county),
        SDQuestion(id: 59, question: "What does the State's Attorney do at the county level?", answer: "Prosecutes crimes, provides legal advice to county officials", category: .county),
        SDQuestion(id: 60, question: "What does the Register of Deeds do?", answer: "Records and maintains property documents, deeds, and mortgages", category: .county),
        SDQuestion(id: 61, question: "What is the role of the County Coroner?", answer: "Investigates deaths and determines cause of death", category: .county),
        SDQuestion(id: 62, question: "Are Pennington County elected officials partisan or nonpartisan?", answer: "Partisan (candidates run with party affiliation)", category: .county),
        SDQuestion(id: 63, question: "Where is the Pennington County Courthouse located?", answer: "315 St. Joseph Street, Rapid City", category: .county),
        SDQuestion(id: 64, question: "What services does Pennington County provide?", answer: "Roads, law enforcement, courts, elections, property records, public health, and emergency services", category: .county),
        SDQuestion(id: 65, question: "How are county commissioners elected in Pennington County?", answer: "By district; each commissioner represents a specific geographic area", category: .county),
        SDQuestion(id: 66, question: "What is the Pennington County Planning Commission?", answer: "An appointed board that reviews zoning and land use decisions", category: .county),
        SDQuestion(id: 67, question: "Where do Pennington County residents vote?", answer: "At designated polling places in their precinct, or by absentee ballot", category: .county),
        SDQuestion(id: 68, question: "What is the main source of revenue for Pennington County?", answer: "Property taxes", category: .county),
        SDQuestion(id: 69, question: "Can citizens attend County Commission meetings?", answer: "Yes, meetings are open to the public under South Dakota open meeting laws", category: .county),
        SDQuestion(id: 70, question: "What national park is partially located in Pennington County?", answer: "Badlands National Park", category: .county),
        SDQuestion(id: 71, question: "What is the approximate population of Pennington County?", answer: "Approximately 115,000 (second most populous county in SD)", category: .county),

        // ═══════════════════════════════════════════════════════════════
        // MUNICIPAL LEVEL - Focus on Rapid City
        // ═══════════════════════════════════════════════════════════════

        SDQuestion(id: 72, question: "What form of government does Rapid City have?", answer: "Mayor-Council form of government", category: .municipal),
        SDQuestion(id: 73, question: "How is the Mayor of Rapid City elected?", answer: "Elected at-large by all city voters", category: .municipal),
        SDQuestion(id: 74, question: "How long is the term for Rapid City's Mayor?", answer: "4 years", category: .municipal),
        SDQuestion(id: 75, question: "What is the Rapid City Common Council?", answer: "The legislative body of Rapid City government", category: .municipal),
        SDQuestion(id: 76, question: "How many members are on the Rapid City Common Council?", answer: "10 Council Members", category: .municipal),
        SDQuestion(id: 77, question: "How are Rapid City Council members elected?", answer: "By ward; 2 members from each of 5 wards", category: .municipal),
        SDQuestion(id: 78, question: "How long is a term for a Rapid City Council member?", answer: "4 years (staggered terms)", category: .municipal),
        SDQuestion(id: 79, question: "Are Rapid City elections partisan or nonpartisan?", answer: "Nonpartisan (no party affiliation on ballot)", category: .municipal),
        SDQuestion(id: 80, question: "When are Rapid City municipal elections held?", answer: "First Tuesday after second Monday in June (odd years)", category: .municipal),
        SDQuestion(id: 81, question: "What does the City Finance Officer do?", answer: "Manages city finances, budget, and serves as city clerk", category: .municipal),
        SDQuestion(id: 82, question: "What is the role of the City Attorney?", answer: "Provides legal counsel to the city and prosecutes municipal ordinance violations", category: .municipal),
        SDQuestion(id: 83, question: "Who provides police services in Rapid City?", answer: "Rapid City Police Department", category: .municipal),
        SDQuestion(id: 84, question: "Who provides fire protection in Rapid City?", answer: "Rapid City Fire Department", category: .municipal),
        SDQuestion(id: 85, question: "What services does Rapid City provide to residents?", answer: "Police, fire, water, sewer, streets, parks, planning, and code enforcement", category: .municipal),
        SDQuestion(id: 86, question: "What is a city ordinance?", answer: "A local law passed by the City Council", category: .municipal),
        SDQuestion(id: 87, question: "What is zoning?", answer: "Regulations that control how land and buildings can be used in different areas", category: .municipal),
        SDQuestion(id: 88, question: "What is the Rapid City Planning Commission?", answer: "An appointed board that reviews development proposals and makes zoning recommendations", category: .municipal),
        SDQuestion(id: 89, question: "Where are Rapid City Council meetings held?", answer: "City Hall Council Chambers, 300 Sixth Street", category: .municipal),
        SDQuestion(id: 90, question: "Can citizens speak at City Council meetings?", answer: "Yes, during public comment periods and public hearings", category: .municipal),
        SDQuestion(id: 91, question: "What is an initiative in Rapid City?", answer: "A process where citizens can propose ordinances through petitions", category: .municipal),
        SDQuestion(id: 92, question: "What is a referendum in Rapid City?", answer: "A process where citizens can vote to approve or reject a Council decision", category: .municipal),
        SDQuestion(id: 93, question: "What is the main source of revenue for Rapid City?", answer: "Sales tax and property tax", category: .municipal),
        SDQuestion(id: 94, question: "Does Rapid City have a local sales tax?", answer: "Yes, a municipal sales tax in addition to state sales tax", category: .municipal),
        SDQuestion(id: 95, question: "What is Rapid City's approximate population?", answer: "Approximately 75,000 (second largest city in South Dakota)", category: .municipal),
        SDQuestion(id: 96, question: "What river runs through Rapid City?", answer: "Rapid Creek", category: .municipal),
        SDQuestion(id: 97, question: "What happened in Rapid City on June 9, 1972?", answer: "The Rapid City Flood, caused by heavy rainfall and dam failure", category: .municipal),
        SDQuestion(id: 98, question: "What is the nickname of Rapid City?", answer: "The City of Presidents (due to presidential statues downtown)", category: .municipal),
        SDQuestion(id: 99, question: "What military installation is near Rapid City?", answer: "Ellsworth Air Force Base", category: .municipal),
        SDQuestion(id: 100, question: "How can residents get involved in Rapid City government?", answer: "Attend meetings, serve on boards/commissions, vote, contact elected officials, or run for office", category: .municipal)
    ]

    static func questionsByCategory(_ category: SDCategory) -> [SDQuestion] {
        questions.filter { $0.category == category }
    }

    static func randomQuestion() -> SDQuestion {
        questions.randomElement()!
    }

    static func shuffledQuestions() -> [SDQuestion] {
        questions.shuffled()
    }

    static var stateQuestions: [SDQuestion] {
        questionsByCategory(.state)
    }

    static var countyQuestions: [SDQuestion] {
        questionsByCategory(.county)
    }

    static var municipalQuestions: [SDQuestion] {
        questionsByCategory(.municipal)
    }
}
