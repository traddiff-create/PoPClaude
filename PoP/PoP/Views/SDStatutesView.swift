//
//  SDStatutesView.swift
//  PoP
//
//  Browse South Dakota Codified Laws (SDCL)
//  Source: https://sdlegislature.gov/Statutes
//

import SwiftUI
import WebKit

struct SDStatutesView: View {
    @State private var selectedTitle: SDStatuteTitle?
    @State private var showWebView = false

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text("South Dakota Codified Laws")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)
                    Text("The complete body of statutory law for South Dakota, organized by title.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 8)
            }

            Section("Browse by Title") {
                ForEach(SDStatuteTitle.allTitles) { title in
                    Button {
                        selectedTitle = title
                        showWebView = true
                    } label: {
                        HStack {
                            Text("Title \(title.number)")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.popBlue)
                                .frame(width: 60, alignment: .leading)

                            Text(title.name)
                                .font(.subheadline)
                                .foregroundColor(.primary)

                            Spacer()

                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }

            Section {
                Link(destination: URL(string: "https://sdlegislature.gov/Statutes")!) {
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.popBlue)
                        Text("View Full Statutes Online")
                            .foregroundColor(.popBlue)
                        Spacer()
                        Image(systemName: "arrow.up.right")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("SD Codified Laws")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showWebView) {
            if let title = selectedTitle {
                NavigationStack {
                    WebViewContainer(url: title.url)
                        .navigationTitle("Title \(title.number)")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Done") {
                                    showWebView = false
                                }
                            }
                        }
                }
            }
        }
    }
}

// MARK: - SD Statute Title
struct SDStatuteTitle: Identifiable {
    let id = UUID()
    let number: String
    let name: String

    var url: URL {
        URL(string: "https://sdlegislature.gov/Statutes/Codified_Laws/\(number)")!
    }

    static let allTitles: [SDStatuteTitle] = [
        SDStatuteTitle(number: "1", name: "State Affairs and Government"),
        SDStatuteTitle(number: "2", name: "Agriculture and Horticulture"),
        SDStatuteTitle(number: "3", name: "Aeronautics"),
        SDStatuteTitle(number: "4", name: "Animals and Livestock"),
        SDStatuteTitle(number: "5", name: "Amusements, Shows, and Sports"),
        SDStatuteTitle(number: "6", name: "Banks and Banking"),
        SDStatuteTitle(number: "7", name: "Counties"),
        SDStatuteTitle(number: "8", name: "State Engineer, Waters, Drains, and Watercourses"),
        SDStatuteTitle(number: "9", name: "Municipalities"),
        SDStatuteTitle(number: "10", name: "Taxation"),
        SDStatuteTitle(number: "10A", name: "Economic Development"),
        SDStatuteTitle(number: "11", name: "Planning, Zoning, and Historic Preservation"),
        SDStatuteTitle(number: "12", name: "Elections"),
        SDStatuteTitle(number: "13", name: "Education"),
        SDStatuteTitle(number: "14", name: "Estates and Trusts"),
        SDStatuteTitle(number: "15", name: "Civil Procedure"),
        SDStatuteTitle(number: "16", name: "Courts and Judiciary"),
        SDStatuteTitle(number: "17", name: "Corporations"),
        SDStatuteTitle(number: "17A", name: "Uniform Partnership Act"),
        SDStatuteTitle(number: "18", name: "Civil Rights"),
        SDStatuteTitle(number: "19", name: "Evidence"),
        SDStatuteTitle(number: "20", name: "Fires and Fire Prevention"),
        SDStatuteTitle(number: "21", name: "Remedies"),
        SDStatuteTitle(number: "22", name: "Crimes"),
        SDStatuteTitle(number: "23", name: "Law Enforcement"),
        SDStatuteTitle(number: "23A", name: "Criminal Procedure"),
        SDStatuteTitle(number: "24", name: "Corrections"),
        SDStatuteTitle(number: "25", name: "Domestic Relations"),
        SDStatuteTitle(number: "26", name: "Children and Minors"),
        SDStatuteTitle(number: "27", name: "Intoxicating Liquors"),
        SDStatuteTitle(number: "27A", name: "Mental Health"),
        SDStatuteTitle(number: "28", name: "Public Welfare"),
        SDStatuteTitle(number: "29", name: "Public Health"),
        SDStatuteTitle(number: "29A", name: "Health Care Facilities"),
        SDStatuteTitle(number: "30", name: "Highways and Bridges"),
        SDStatuteTitle(number: "31", name: "Motor Vehicles"),
        SDStatuteTitle(number: "32", name: "Railroads"),
        SDStatuteTitle(number: "33", name: "Property"),
        SDStatuteTitle(number: "34", name: "Game, Fish, Parks, and Forestry"),
        SDStatuteTitle(number: "34A", name: "Environment and Natural Resources"),
        SDStatuteTitle(number: "35", name: "Insurance"),
        SDStatuteTitle(number: "36", name: "Professions and Occupations"),
        SDStatuteTitle(number: "37", name: "Trade Regulation"),
        SDStatuteTitle(number: "38", name: "Mines and Mining"),
        SDStatuteTitle(number: "39", name: "Weights, Measures, and Standards"),
        SDStatuteTitle(number: "40", name: "Wills"),
        SDStatuteTitle(number: "41", name: "Employment"),
        SDStatuteTitle(number: "42", name: "Military and Veterans Affairs"),
        SDStatuteTitle(number: "43", name: "Property Rights and Transactions"),
        SDStatuteTitle(number: "44", name: "State Lands"),
        SDStatuteTitle(number: "45", name: "Oil and Gas"),
        SDStatuteTitle(number: "46", name: "Water Rights"),
        SDStatuteTitle(number: "46A", name: "Water Development Districts"),
        SDStatuteTitle(number: "47", name: "Uniform Commercial Code"),
        SDStatuteTitle(number: "48", name: "Public Utilities"),
        SDStatuteTitle(number: "49", name: "Public Utilities Commission"),
        SDStatuteTitle(number: "50", name: "Guardians and Conservators"),
        SDStatuteTitle(number: "51", name: "Financial Institutions"),
        SDStatuteTitle(number: "52", name: "Usury and Interest"),
        SDStatuteTitle(number: "53", name: "Consumer Credit Transactions"),
        SDStatuteTitle(number: "54", name: "Contracts"),
        SDStatuteTitle(number: "55", name: "Fiduciaries"),
        SDStatuteTitle(number: "56", name: "Secured Transactions"),
        SDStatuteTitle(number: "57", name: "Mortgages and Liens"),
        SDStatuteTitle(number: "58", name: "Landlord and Tenant"),
        SDStatuteTitle(number: "59", name: "Suretyship and Guaranty"),
        SDStatuteTitle(number: "60", name: "Labor"),
        SDStatuteTitle(number: "61", name: "Workers Compensation"),
        SDStatuteTitle(number: "62", name: "Unemployment Compensation"),
        SDStatuteTitle(number: "63", name: "Tribal Relations"),
    ]
}

// MARK: - WebView Container
struct WebViewContainer: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No update needed
    }
}

#Preview {
    NavigationStack {
        SDStatutesView()
    }
}
