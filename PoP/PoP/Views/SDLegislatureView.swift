//
//  SDLegislatureView.swift
//  PoP
//
//  South Dakota Legislature resources - Statutes and Bills
//  Data from: https://sdlegislature.gov/
//

import SwiftUI

struct SDLegislatureView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "scroll.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.popGold)

                    Text("SD Legislature")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("Statutes, Bills & Legislative Resources")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)

                // Main Features
                VStack(spacing: 16) {
                    // SD Codified Laws (Statutes)
                    NavigationLink {
                        SDStatutesView()
                    } label: {
                        LegislatureCard(
                            icon: "books.vertical",
                            title: "SD Codified Laws",
                            subtitle: "Browse South Dakota statutes and laws",
                            badge: "SDCL",
                            color: .popBlue
                        )
                    }

                    // 2026 Legislative Session Bills
                    NavigationLink {
                        SDBillsView()
                    } label: {
                        LegislatureCard(
                            icon: "doc.text.magnifyingglass",
                            title: "2026 Session Bills",
                            subtitle: "Current legislative session bills",
                            badge: "71st Session",
                            color: .popGold
                        )
                    }

                    // Legislature Website
                    Link(destination: URL(string: "https://sdlegislature.gov/")!) {
                        LegislatureCard(
                            icon: "globe",
                            title: "Legislature Website",
                            subtitle: "Full access to sdlegislature.gov",
                            badge: nil,
                            color: .popDarkBlue,
                            isExternal: true
                        )
                    }
                }
                .padding(.horizontal)

                // Quick Info
                VStack(alignment: .leading, spacing: 16) {
                    Text("About the SD Legislature")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    VStack(alignment: .leading, spacing: 12) {
                        InfoRow(label: "Senate", value: "35 members")
                        InfoRow(label: "House", value: "70 members")
                        InfoRow(label: "Session", value: "Meets annually in Pierre")
                        InfoRow(label: "Term Length", value: "2 years for all legislators")
                    }

                    Divider()

                    Text("The South Dakota Legislature is a bicameral body consisting of the Senate and House of Representatives. Sessions typically begin in January.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.popLightBackground)
                .cornerRadius(16)
                .padding(.horizontal)

                // Contact Info
                VStack(alignment: .leading, spacing: 12) {
                    Text("Legislative Research Council")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.popBlue)
                        Text("(605) 773-3251")
                            .font(.subheadline)
                    }

                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.popBlue)
                        Text("LRC@sdlegislature.gov")
                            .font(.subheadline)
                    }

                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.popBlue)
                        Text("500 E. Capitol Ave, Pierre, SD")
                            .font(.subheadline)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("SD Legislature")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Legislature Card
struct LegislatureCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let badge: String?
    let color: Color
    var isExternal: Bool = false

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(color)
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    if let badge = badge {
                        Text(badge)
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(color)
                            .cornerRadius(8)
                    }
                }

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: isExternal ? "arrow.up.right" : "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Info Row
struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
                .foregroundColor(.popDarkBlue)
        }
        .font(.subheadline)
    }
}

#Preview {
    NavigationStack {
        SDLegislatureView()
    }
}
