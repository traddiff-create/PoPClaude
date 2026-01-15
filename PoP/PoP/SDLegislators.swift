//
//  SDLegislators.swift
//  PoP
//
//  South Dakota Legislators Database
//  Source: https://sdlegislature.gov/Legislators
//
//  NOTE: This data should be updated each legislative session
//  Last updated: January 2026 (71st Session)
//

import Foundation

// MARK: - Representative Model
struct Representative: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let chamber: Chamber
    let district: Int
    let party: Party
    let email: String
    let phone: String?
    let hometown: String?
    let photoURL: String?

    enum Chamber: String, CaseIterable {
        case sdSenate = "SD Senate"
        case sdHouse = "SD House"
        case usSenate = "US Senate"
        case usHouse = "US House"

        var icon: String {
            switch self {
            case .sdSenate, .usSenate: return "building.columns"
            case .sdHouse, .usHouse: return "person.3"
            }
        }

        var isState: Bool {
            self == .sdSenate || self == .sdHouse
        }

        var isFederal: Bool {
            self == .usSenate || self == .usHouse
        }
    }

    enum Party: String, CaseIterable {
        case republican = "R"
        case democrat = "D"
        case independent = "I"

        var fullName: String {
            switch self {
            case .republican: return "Republican"
            case .democrat: return "Democrat"
            case .independent: return "Independent"
            }
        }

        var color: String {
            switch self {
            case .republican: return "red"
            case .democrat: return "blue"
            case .independent: return "purple"
            }
        }
    }

    var displayTitle: String {
        switch chamber {
        case .sdSenate: return "Senator"
        case .sdHouse: return "Representative"
        case .usSenate: return "U.S. Senator"
        case .usHouse: return "U.S. Representative"
        }
    }

    var districtDisplay: String {
        if chamber.isFederal && chamber == .usHouse {
            return "At-Large"
        }
        return "District \(district)"
    }
}

// MARK: - Legislators Database
struct SDLegislators {

    // MARK: - US Congress (South Dakota)
    static let usCongressMembers: [Representative] = [
        Representative(
            name: "John Thune",
            chamber: .usSenate,
            district: 0,
            party: .republican,
            email: "john_thune@thune.senate.gov",
            phone: "(202) 224-2321",
            hometown: "Sioux Falls",
            photoURL: nil
        ),
        Representative(
            name: "Mike Rounds",
            chamber: .usSenate,
            district: 0,
            party: .republican,
            email: "mike_rounds@rounds.senate.gov",
            phone: "(202) 224-5842",
            hometown: "Fort Pierre",
            photoURL: nil
        ),
        Representative(
            name: "Dusty Johnson",
            chamber: .usHouse,
            district: 1,
            party: .republican,
            email: "dusty.johnson@mail.house.gov",
            phone: "(202) 225-2801",
            hometown: "Mitchell",
            photoURL: nil
        )
    ]

    // MARK: - SD State Senate (35 members)
    // Updated: January 2026 (71st Session) from Ballotpedia
    static let sdSenate: [Representative] = [
        // District 1-35 Senators (32 Republicans, 3 Democrats)
        Representative(name: "Michael Rohl", chamber: .sdSenate, district: 1, party: .republican, email: "michael.rohl@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Steve Kolbeck", chamber: .sdSenate, district: 2, party: .republican, email: "steve.kolbeck@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Carl Perry", chamber: .sdSenate, district: 3, party: .republican, email: "carl.perry@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Stephanie Sauder", chamber: .sdSenate, district: 4, party: .republican, email: "stephanie.sauder@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Glen Vilhauer", chamber: .sdSenate, district: 5, party: .republican, email: "glen.vilhauer@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Ernie Otten Jr.", chamber: .sdSenate, district: 6, party: .republican, email: "ernie.otten@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Tim Reed", chamber: .sdSenate, district: 7, party: .republican, email: "tim.reed@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Casey Crabtree", chamber: .sdSenate, district: 8, party: .republican, email: "casey.crabtree@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Joy Hohn", chamber: .sdSenate, district: 9, party: .republican, email: "joy.hohn@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Liz Larson", chamber: .sdSenate, district: 10, party: .democrat, email: "liz.larson@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Chris Karr", chamber: .sdSenate, district: 11, party: .republican, email: "chris.karr@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Arch Beal", chamber: .sdSenate, district: 12, party: .republican, email: "arch.beal@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Sue Peterson", chamber: .sdSenate, district: 13, party: .republican, email: "sue.peterson@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Larry P. Zikmund", chamber: .sdSenate, district: 14, party: .republican, email: "larry.zikmund@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Jamie Smith", chamber: .sdSenate, district: 15, party: .democrat, email: "jamie.smith@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Kevin Jensen", chamber: .sdSenate, district: 16, party: .republican, email: "kevin.jensen@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Sydney Davis", chamber: .sdSenate, district: 17, party: .republican, email: "sydney.davis@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Lauren Nelson", chamber: .sdSenate, district: 18, party: .republican, email: "lauren.nelson@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Kyle Schoenfish", chamber: .sdSenate, district: 19, party: .republican, email: "kyle.schoenfish@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Paul Miskimins", chamber: .sdSenate, district: 20, party: .republican, email: "paul.miskimins@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "MyKala Voita", chamber: .sdSenate, district: 21, party: .republican, email: "mykala.voita@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Brandon Wipf", chamber: .sdSenate, district: 22, party: .republican, email: "brandon.wipf@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Mark Lapka", chamber: .sdSenate, district: 23, party: .republican, email: "mark.lapka@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Jim Mehlhaff", chamber: .sdSenate, district: 24, party: .republican, email: "jim.mehlhaff@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Tom Pischke", chamber: .sdSenate, district: 25, party: .republican, email: "tom.pischke@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Tamara Grove", chamber: .sdSenate, district: 26, party: .republican, email: "tamara.grove@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Red Dawn Foster", chamber: .sdSenate, district: 27, party: .democrat, email: "red.foster@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "J. Sam Marty", chamber: .sdSenate, district: 28, party: .republican, email: "sam.marty@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "John Carley", chamber: .sdSenate, district: 29, party: .republican, email: "john.carley@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Amber Hulse", chamber: .sdSenate, district: 30, party: .republican, email: "amber.hulse@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Randy Deibert", chamber: .sdSenate, district: 31, party: .republican, email: "randy.deibert@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Helene Duhamel", chamber: .sdSenate, district: 32, party: .republican, email: "helene.duhamel@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Curt Voight", chamber: .sdSenate, district: 33, party: .republican, email: "curt.voight@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Taffy Howard", chamber: .sdSenate, district: 34, party: .republican, email: "taffy.howard@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Greg Blanc", chamber: .sdSenate, district: 35, party: .republican, email: "greg.blanc@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
    ]

    // MARK: - SD State House (70 members)
    // Updated: January 2026 (71st Session) from Ballotpedia
    static let sdHouse: [Representative] = [
        // District 1-35 Representatives (65 Republicans, 5 Democrats)
        // District 1
        Representative(name: "Nicholas Fosness", chamber: .sdHouse, district: 1, party: .republican, email: "nicholas.fosness@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Logan Manhart", chamber: .sdHouse, district: 1, party: .republican, email: "logan.manhart@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 2
        Representative(name: "David Kull", chamber: .sdHouse, district: 2, party: .republican, email: "david.kull@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "John Sjaarda", chamber: .sdHouse, district: 2, party: .republican, email: "john.sjaarda@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 3
        Representative(name: "Al Novstrup", chamber: .sdHouse, district: 3, party: .republican, email: "al.novstrup@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Brandei Schaefbauer", chamber: .sdHouse, district: 3, party: .republican, email: "brandei.schaefbauer@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 4
        Representative(name: "Dylan Jordan", chamber: .sdHouse, district: 4, party: .republican, email: "dylan.jordan@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Kent Roe", chamber: .sdHouse, district: 4, party: .republican, email: "kent.roe@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 5
        Representative(name: "Josephine Garcia", chamber: .sdHouse, district: 5, party: .republican, email: "josephine.garcia@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Matt Roby", chamber: .sdHouse, district: 5, party: .republican, email: "matt.roby@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 6
        Representative(name: "Aaron Aylward", chamber: .sdHouse, district: 6, party: .republican, email: "aaron.aylward@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Tim Czmowski", chamber: .sdHouse, district: 6, party: .republican, email: "tim.czmowski@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 7
        Representative(name: "Roger DeGroot", chamber: .sdHouse, district: 7, party: .republican, email: "roger.degroot@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Mellissa Heermann", chamber: .sdHouse, district: 7, party: .republican, email: "mellissa.heermann@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 8
        Representative(name: "Tim Reisch", chamber: .sdHouse, district: 8, party: .republican, email: "tim.reisch@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Tim Walburg", chamber: .sdHouse, district: 8, party: .republican, email: "tim.walburg@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 9
        Representative(name: "Tesa Schwans", chamber: .sdHouse, district: 9, party: .republican, email: "tesa.schwans@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Bethany Soye", chamber: .sdHouse, district: 9, party: .republican, email: "bethany.soye@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 10
        Representative(name: "Bobbi Andera", chamber: .sdHouse, district: 10, party: .republican, email: "bobbi.andera@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Erin Healy", chamber: .sdHouse, district: 10, party: .democrat, email: "erin.healy@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 11
        Representative(name: "Brian Mulder", chamber: .sdHouse, district: 11, party: .republican, email: "brian.mulder@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Keri Weems", chamber: .sdHouse, district: 11, party: .republican, email: "keri.weems@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 12
        Representative(name: "Amber Arlint", chamber: .sdHouse, district: 12, party: .republican, email: "amber.arlint@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Greg Jamison", chamber: .sdHouse, district: 12, party: .republican, email: "greg.jamison@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 13
        Representative(name: "John Hughes", chamber: .sdHouse, district: 13, party: .republican, email: "john.hughes@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Jack Kolbeck", chamber: .sdHouse, district: 13, party: .republican, email: "jack.kolbeck@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 14
        Representative(name: "Tony Kayser", chamber: .sdHouse, district: 14, party: .republican, email: "tony.kayser@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Taylor Rae Rehfeldt", chamber: .sdHouse, district: 14, party: .republican, email: "taylor.rehfeldt@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 15
        Representative(name: "Erik Muckey", chamber: .sdHouse, district: 15, party: .democrat, email: "erik.muckey@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Kadyn Wittman", chamber: .sdHouse, district: 15, party: .democrat, email: "kadyn.wittman@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 16
        Representative(name: "Karla Lems", chamber: .sdHouse, district: 16, party: .republican, email: "karla.lems@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "John Shubeck", chamber: .sdHouse, district: 16, party: .republican, email: "john.shubeck@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 17
        Representative(name: "Chris Kassin", chamber: .sdHouse, district: 17, party: .republican, email: "chris.kassin@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "William Shorma", chamber: .sdHouse, district: 17, party: .republican, email: "william.shorma@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 18
        Representative(name: "Julie Auch", chamber: .sdHouse, district: 18, party: .republican, email: "julie.auch@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Mike Stevens", chamber: .sdHouse, district: 18, party: .republican, email: "mike.stevens@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 19
        Representative(name: "Jessica Bahmuller", chamber: .sdHouse, district: 19, party: .republican, email: "jessica.bahmuller@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Drew Peterson", chamber: .sdHouse, district: 19, party: .republican, email: "drew.peterson@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 20
        Representative(name: "Jeff Bathke", chamber: .sdHouse, district: 20, party: .republican, email: "jeff.bathke@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Kaley Nolz", chamber: .sdHouse, district: 20, party: .republican, email: "kaley.nolz@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 21
        Representative(name: "Jim Halverson", chamber: .sdHouse, district: 21, party: .republican, email: "jim.halverson@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Marty Overweg", chamber: .sdHouse, district: 21, party: .republican, email: "marty.overweg@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 22
        Representative(name: "Lana Greenfield", chamber: .sdHouse, district: 22, party: .republican, email: "lana.greenfield@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Kevin Van Diepen", chamber: .sdHouse, district: 22, party: .republican, email: "kevin.vandiepen@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 23
        Representative(name: "Spencer Gosch", chamber: .sdHouse, district: 23, party: .republican, email: "spencer.gosch@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Scott Moore", chamber: .sdHouse, district: 23, party: .republican, email: "scott.moore@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 24
        Representative(name: "Will Mortenson", chamber: .sdHouse, district: 24, party: .republican, email: "will.mortenson@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Mike Weisgram", chamber: .sdHouse, district: 24, party: .republican, email: "mike.weisgram@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 25
        Representative(name: "Jon Hansen", chamber: .sdHouse, district: 25, party: .republican, email: "jon.hansen@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Leslie J. Heinemann", chamber: .sdHouse, district: 25, party: .republican, email: "leslie.heinemann@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 26A
        Representative(name: "Eric Emery", chamber: .sdHouse, district: 26, party: .democrat, email: "eric.emery@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 26B
        Representative(name: "Rebecca Reimer", chamber: .sdHouse, district: 26, party: .republican, email: "rebecca.reimer@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 27
        Representative(name: "Elizabeth May", chamber: .sdHouse, district: 27, party: .republican, email: "elizabeth.may@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Peri Pourier", chamber: .sdHouse, district: 27, party: .republican, email: "peri.pourier@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 28A
        Representative(name: "Jana Hunt", chamber: .sdHouse, district: 28, party: .republican, email: "jana.hunt@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 28B
        Representative(name: "Travis Ismay", chamber: .sdHouse, district: 28, party: .republican, email: "travis.ismay@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 29
        Representative(name: "Terri Jorgenson", chamber: .sdHouse, district: 29, party: .republican, email: "terri.jorgenson@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Kathy Rice", chamber: .sdHouse, district: 29, party: .republican, email: "kathy.rice@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 30 (Pennington County)
        Representative(name: "Tim Goodwin", chamber: .sdHouse, district: 30, party: .republican, email: "tim.goodwin@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Trish Ladner", chamber: .sdHouse, district: 30, party: .republican, email: "trish.ladner@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 31 (Pennington County)
        Representative(name: "Mary Fitzgerald", chamber: .sdHouse, district: 31, party: .republican, email: "mary.fitzgerald@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Scott Odenbach", chamber: .sdHouse, district: 31, party: .republican, email: "scott.odenbach@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 32 (Pennington County)
        Representative(name: "Steve Duffy", chamber: .sdHouse, district: 32, party: .republican, email: "steve.duffy@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Nicole Uhre-Balk", chamber: .sdHouse, district: 32, party: .democrat, email: "nicole.uhre-balk@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 33 (Pennington County)
        Representative(name: "Phil Jensen", chamber: .sdHouse, district: 33, party: .republican, email: "phil.jensen@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Curt Massie", chamber: .sdHouse, district: 33, party: .republican, email: "curt.massie@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 34 (Pennington County)
        Representative(name: "Heather Baxter", chamber: .sdHouse, district: 34, party: .republican, email: "heather.baxter@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Mike Derby", chamber: .sdHouse, district: 34, party: .republican, email: "mike.derby@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        // District 35 (Pennington County)
        Representative(name: "Tina Mulally", chamber: .sdHouse, district: 35, party: .republican, email: "tina.mulally@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
        Representative(name: "Tony Randolph", chamber: .sdHouse, district: 35, party: .republican, email: "tony.randolph@sdlegislature.gov", phone: nil, hometown: nil, photoURL: nil),
    ]

    // MARK: - Pennington County Legislators
    // Districts that include Pennington County: 30, 31, 32, 33, 34, 35
    static var penningtonCountyLegislators: [Representative] {
        let penningtonDistricts = [30, 31, 32, 33, 34, 35]
        return (sdSenate + sdHouse).filter { penningtonDistricts.contains($0.district) }
    }

    // MARK: - All Legislators
    static var allStateLegislators: [Representative] {
        sdSenate + sdHouse
    }

    static var allLegislators: [Representative] {
        usCongressMembers + allStateLegislators
    }

    // MARK: - Lookup Functions
    static func legislators(forDistrict district: Int) -> [Representative] {
        allStateLegislators.filter { $0.district == district }
    }

    static func senators() -> [Representative] {
        sdSenate
    }

    static func representatives() -> [Representative] {
        sdHouse
    }

    static func byParty(_ party: Representative.Party) -> [Representative] {
        allStateLegislators.filter { $0.party == party }
    }

    // MARK: - Legislature Website
    static let legislatureURL = URL(string: "https://sdlegislature.gov/Legislators")!
    static let findMyLegislatorURL = URL(string: "https://sdlegislature.gov/Legislators/Contacts/ByAddress")!
}

// MARK: - Email Composer Helper
struct EmailComposer {
    static func composeEmail(to recipients: [Representative], subject: String = "Message from a Constituent", body: String = "") -> URL? {
        let emails = recipients.map { $0.email }.joined(separator: ",")
        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        return URL(string: "mailto:\(emails)?subject=\(encodedSubject)&body=\(encodedBody)")
    }

    static func composeEmailToAll(chamber: Representative.Chamber? = nil) -> URL? {
        var recipients: [Representative]

        if let chamber = chamber {
            recipients = SDLegislators.allLegislators.filter { $0.chamber == chamber }
        } else {
            recipients = SDLegislators.allLegislators
        }

        return composeEmail(to: recipients)
    }
}

// MARK: - Message Templates
struct MessageTemplate: Identifiable {
    let id = UUID()
    let title: String
    let subject: String
    let body: String

    static let templates: [MessageTemplate] = [
        MessageTemplate(
            title: "General Message",
            subject: "Message from a Constituent",
            body: """
            Dear [Representative Name],

            As your constituent, I am writing to share my thoughts on [issue].

            [Your message here]

            Thank you for your service to South Dakota.

            Sincerely,
            [Your Name]
            [Your Address]
            """
        ),
        MessageTemplate(
            title: "Support a Bill",
            subject: "Please Support [Bill Number]",
            body: """
            Dear [Representative Name],

            I am writing to ask you to support [Bill Number] regarding [topic].

            This legislation is important because [reasons].

            I respectfully ask for your support on this measure.

            Thank you,
            [Your Name]
            [Your Address]
            """
        ),
        MessageTemplate(
            title: "Oppose a Bill",
            subject: "Please Oppose [Bill Number]",
            body: """
            Dear [Representative Name],

            I am writing to ask you to oppose [Bill Number] regarding [topic].

            I have concerns about this legislation because [reasons].

            I respectfully ask that you vote against this measure.

            Thank you,
            [Your Name]
            [Your Address]
            """
        ),
        MessageTemplate(
            title: "Request a Meeting",
            subject: "Meeting Request from Constituent",
            body: """
            Dear [Representative Name],

            I am a constituent in your district and would like to schedule a meeting to discuss [topic].

            I am available [suggest times] and can meet at your office or another convenient location.

            Please let me know if this would be possible.

            Thank you,
            [Your Name]
            [Your Phone Number]
            [Your Address]
            """
        ),
        MessageTemplate(
            title: "Thank You",
            subject: "Thank You for Your Vote on [Bill/Issue]",
            body: """
            Dear [Representative Name],

            I wanted to thank you for your vote on [bill/issue].

            Your leadership on this matter is appreciated by constituents like me.

            Thank you for representing South Dakota.

            Sincerely,
            [Your Name]
            """
        )
    ]
}
