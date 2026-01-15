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
    // NOTE: Sample data - should be updated from sdlegislature.gov
    static let sdSenate: [Representative] = [
        // District 1-35 Senators
        Representative(name: "Larry Tidemann", chamber: .sdSenate, district: 7, party: .republican, email: "larry.tidemann@sdlegislature.gov", phone: nil, hometown: "Brookings", photoURL: nil),
        Representative(name: "Helene Duhamel", chamber: .sdSenate, district: 32, party: .republican, email: "helene.duhamel@sdlegislature.gov", phone: nil, hometown: "Rapid City", photoURL: nil),
        Representative(name: "Michael Rohl", chamber: .sdSenate, district: 33, party: .republican, email: "michael.rohl@sdlegislature.gov", phone: nil, hometown: "Aberdeen", photoURL: nil),
        Representative(name: "Jim Bolin", chamber: .sdSenate, district: 16, party: .republican, email: "jim.bolin@sdlegislature.gov", phone: nil, hometown: "Canton", photoURL: nil),
        Representative(name: "Reynold Nesiba", chamber: .sdSenate, district: 15, party: .democrat, email: "reynold.nesiba@sdlegislature.gov", phone: nil, hometown: "Sioux Falls", photoURL: nil),
        // Add more senators as needed - this is a sample
    ]

    // MARK: - SD State House (70 members)
    // NOTE: Sample data - should be updated from sdlegislature.gov
    static let sdHouse: [Representative] = [
        // District representatives (2 per district)
        Representative(name: "Jon Hansen", chamber: .sdHouse, district: 25, party: .republican, email: "jon.hansen@sdlegislature.gov", phone: nil, hometown: "Dell Rapids", photoURL: nil),
        Representative(name: "Tina Mulally", chamber: .sdHouse, district: 35, party: .republican, email: "tina.mulally@sdlegislature.gov", phone: nil, hometown: "Rapid City", photoURL: nil),
        Representative(name: "Scott Odenbach", chamber: .sdHouse, district: 31, party: .republican, email: "scott.odenbach@sdlegislature.gov", phone: nil, hometown: "Spearfish", photoURL: nil),
        Representative(name: "Peri Pourier", chamber: .sdHouse, district: 27, party: .democrat, email: "peri.pourier@sdlegislature.gov", phone: nil, hometown: "Pine Ridge", photoURL: nil),
        Representative(name: "Linda Duba", chamber: .sdHouse, district: 15, party: .democrat, email: "linda.duba@sdlegislature.gov", phone: nil, hometown: "Sioux Falls", photoURL: nil),
        // Add more representatives as needed - this is a sample
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
