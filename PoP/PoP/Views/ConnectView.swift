//
//  ConnectView.swift
//  PoP
//
//  Community links and newsletter signup
//

import SwiftUI
import UIKit

struct ConnectView: View {
    @StateObject private var newsletterManager = NewsletterManager.shared
    @State private var name = ""
    @State private var email = ""
    @State private var showingSignupAlert = false
    @State private var signupMessage = ""
    @State private var showingExportSheet = false
    @State private var exportURL: URL?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Join the Community
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "person.3.fill")
                                .font(.title2)
                                .foregroundColor(.popGold)
                            Text("Join the Community")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.popDarkBlue)
                        }

                        Text("Connect with fellow citizens who believe in putting people over party.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        // Discord link placeholder
                        Link(destination: URL(string: "https://www.peopleoverpartysd.com/")!) {
                            HStack {
                                Image(systemName: "bubble.left.and.bubble.right.fill")
                                Text("Join Our Community")
                                Image(systemName: "arrow.up.right")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                    }
                    .padding()
                    .cardStyle()

                    // Newsletter Signup
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .font(.title2)
                                .foregroundColor(.popBlue)
                            Text("Newsletter")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.popDarkBlue)
                        }

                        Text("Stay informed about local civic events, voter education opportunities, and ways to get involved.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        VStack(spacing: 12) {
                            TextField("Your Name", text: $name)
                                .textFieldStyle(PopTextFieldStyle())

                            TextField("Email Address", text: $email)
                                .textFieldStyle(PopTextFieldStyle())
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                        }

                        Button {
                            submitNewsletter()
                        } label: {
                            HStack {
                                Image(systemName: "paperplane.fill")
                                Text("Subscribe")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(GoldButtonStyle())
                        .disabled(name.isEmpty || email.isEmpty)
                        .opacity(name.isEmpty || email.isEmpty ? 0.6 : 1)

                        // Signup count and export
                        if newsletterManager.signupCount > 0 {
                            HStack {
                                Text("\(newsletterManager.signupCount) signup\(newsletterManager.signupCount == 1 ? "" : "s") collected")
                                    .font(.caption)
                                    .foregroundColor(.secondary)

                                Spacer()

                                Button {
                                    exportSignups()
                                } label: {
                                    HStack(spacing: 4) {
                                        Image(systemName: "square.and.arrow.up")
                                        Text("Export")
                                    }
                                    .font(.caption)
                                    .fontWeight(.medium)
                                }
                            }
                            .padding(.top, 4)
                        }
                    }
                    .padding()
                    .cardStyle()

                    // Social Media
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "at")
                                .font(.title2)
                                .foregroundColor(.popGold)
                            Text("Follow Us")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.popDarkBlue)
                        }

                        SocialLink(
                            platform: "Instagram",
                            handle: "@bettertogether_605",
                            icon: "camera.fill",
                            url: "https://www.instagram.com/bettertogether_605/"
                        )

                        SocialLink(
                            platform: "Website",
                            handle: "peopleoverpartysd.com",
                            icon: "globe",
                            url: "https://www.peopleoverpartysd.com/"
                        )
                    }
                    .padding()
                    .cardStyle()

                    // Contact Info
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "envelope.badge.fill")
                                .font(.title2)
                                .foregroundColor(.popBlue)
                            Text("Contact Us")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.popDarkBlue)
                        }

                        VStack(alignment: .leading, spacing: 12) {
                            ContactRow(icon: "envelope", text: "hello@peopleoverpartysd.com")
                            ContactRow(icon: "phone", text: "(605) 389-3613")
                            ContactRow(icon: "mappin", text: "2511 W Chicago, Rapid City, SD")
                        }
                    }
                    .padding()
                    .cardStyle()
                }
                .padding()
            }
            .background(Color.popLightBackground)
            .navigationTitle("Connect")
            .alert("Newsletter Signup", isPresented: $showingSignupAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(signupMessage)
            }
            .sheet(isPresented: $showingExportSheet) {
                if let url = exportURL {
                    ShareSheet(activityItems: [url])
                }
            }
        }
    }

    private func submitNewsletter() {
        newsletterManager.addSignup(name: name, email: email)
        signupMessage = "Thanks, \(name)! You're signed up for updates at \(email)."
        showingSignupAlert = true
        name = ""
        email = ""
    }

    private func exportSignups() {
        if let url = newsletterManager.exportToFileURL() {
            exportURL = url
            showingExportSheet = true
        }
    }
}

// MARK: - Custom TextField Style
struct PopTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.popBlue.opacity(0.3), lineWidth: 1)
            )
    }
}

// MARK: - Social Link
struct SocialLink: View {
    let platform: String
    let handle: String
    let icon: String
    let url: String

    var body: some View {
        if let linkURL = URL(string: url) {
            Link(destination: linkURL) {
                HStack {
                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundColor(.popBlue)
                        .frame(width: 40)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(platform)
                            .font(.headline)
                            .foregroundColor(.popDarkBlue)
                        Text(handle)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Image(systemName: "arrow.up.right")
                        .font(.caption)
                        .foregroundColor(.popBlue)
                }
                .padding()
                .background(Color.popBlue.opacity(0.05))
                .cornerRadius(12)
            }
        }
    }
}

// MARK: - Contact Row
struct ContactRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.popBlue)
                .frame(width: 24)
            Text(text)
                .font(.subheadline)
                .foregroundColor(.popDarkBlue)
        }
    }
}

// MARK: - Share Sheet
struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    ConnectView()
}
