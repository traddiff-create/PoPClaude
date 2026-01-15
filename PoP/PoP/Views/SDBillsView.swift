//
//  SDBillsView.swift
//  PoP
//
//  Browse 2026 South Dakota Legislative Session Bills
//  Source: https://sdlegislature.gov/Session/Bills/71
//

import SwiftUI
import WebKit

struct SDBillsView: View {
    @State private var showSearch = false
    @State private var showFullBrowser = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "doc.text.magnifyingglass")
                        .font(.system(size: 50))
                        .foregroundColor(.popGold)

                    Text("2026 Session Bills")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("71st Legislative Session")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)

                // Quick Access Buttons
                VStack(spacing: 16) {
                    // Search Bills - Opens web view with search
                    Button {
                        showSearch = true
                    } label: {
                        BillActionCard(
                            icon: "magnifyingglass",
                            title: "Search Bills",
                            subtitle: "Search by keyword, bill number, or sponsor",
                            color: .popBlue
                        )
                    }

                    // Browse All Bills
                    Button {
                        showFullBrowser = true
                    } label: {
                        BillActionCard(
                            icon: "list.bullet.rectangle",
                            title: "Browse All Bills",
                            subtitle: "View complete list of 2026 session bills",
                            color: .popGold
                        )
                    }
                }
                .padding(.horizontal)

                // Bill Categories
                VStack(alignment: .leading, spacing: 16) {
                    Text("Browse by Type")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)
                        .padding(.horizontal)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        BillTypeButton(title: "House Bills", code: "HB", url: "https://sdlegislature.gov/Session/Bills/71?Type=HB")
                        BillTypeButton(title: "Senate Bills", code: "SB", url: "https://sdlegislature.gov/Session/Bills/71?Type=SB")
                        BillTypeButton(title: "House Joints", code: "HJ", url: "https://sdlegislature.gov/Session/Bills/71?Type=HJ")
                        BillTypeButton(title: "Senate Joints", code: "SJ", url: "https://sdlegislature.gov/Session/Bills/71?Type=SJ")
                        BillTypeButton(title: "Concurrent", code: "HC/SC", url: "https://sdlegislature.gov/Session/Bills/71?Type=HC")
                        BillTypeButton(title: "Resolutions", code: "HR/SR", url: "https://sdlegislature.gov/Session/Bills/71?Type=HR")
                    }
                    .padding(.horizontal)
                }

                // Session Info
                VStack(alignment: .leading, spacing: 12) {
                    Text("About the 71st Session")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    VStack(alignment: .leading, spacing: 8) {
                        SessionInfoRow(label: "Session", value: "71st Legislative Session")
                        SessionInfoRow(label: "Year", value: "2026")
                        SessionInfoRow(label: "Location", value: "Pierre, SD")
                        SessionInfoRow(label: "Type", value: "Regular Session")
                    }

                    Divider()

                    Text("The South Dakota Legislature meets annually. Bills must pass both chambers and be signed by the Governor to become law.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.popLightBackground)
                .cornerRadius(16)
                .padding(.horizontal)

                // External Link
                Link(destination: URL(string: "https://sdlegislature.gov/Session/Bills/71")!) {
                    HStack {
                        Image(systemName: "globe")
                        Text("View on sdlegislature.gov")
                        Spacer()
                        Image(systemName: "arrow.up.right")
                            .font(.caption)
                    }
                    .foregroundColor(.popBlue)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("2026 Bills")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showSearch) {
            NavigationStack {
                BillSearchWebView(url: URL(string: "https://sdlegislature.gov/Session/Bills/71")!)
                    .navigationTitle("Search Bills")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                showSearch = false
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $showFullBrowser) {
            NavigationStack {
                BillSearchWebView(url: URL(string: "https://sdlegislature.gov/Session/Bills/71")!)
                    .navigationTitle("All Bills")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                showFullBrowser = false
                            }
                        }
                    }
            }
        }
    }
}

// MARK: - Bill Action Card
struct BillActionCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(color)
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Bill Type Button
struct BillTypeButton: View {
    let title: String
    let code: String
    let url: String
    @State private var showWebView = false

    var body: some View {
        Button {
            showWebView = true
        } label: {
            VStack(spacing: 8) {
                Text(code)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.popBlue)

                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
        .sheet(isPresented: $showWebView) {
            NavigationStack {
                BillSearchWebView(url: URL(string: url)!)
                    .navigationTitle(title)
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

// MARK: - Session Info Row
struct SessionInfoRow: View {
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

// MARK: - Bill Search WebView
struct BillSearchWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No update needed
    }
}

#Preview {
    NavigationStack {
        SDBillsView()
    }
}
