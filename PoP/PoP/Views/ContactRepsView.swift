//
//  ContactRepsView.swift
//  PoP
//
//  Contact your representatives - individual or group email
//

import SwiftUI

struct ContactRepsView: View {
    @State private var selectedReps: Set<Representative> = []
    @State private var showEmailComposer = false
    @State private var showTemplates = false
    @State private var selectedTemplate: MessageTemplate?
    @State private var showFindByAddress = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "envelope.badge.person.crop")
                        .font(.system(size: 50))
                        .foregroundColor(.popBlue)

                    Text("Contact Representatives")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("Email or call your elected officials")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)

                // Quick Actions
                VStack(spacing: 12) {
                    // Find My Reps
                    Button {
                        showFindByAddress = true
                    } label: {
                        QuickActionRow(
                            icon: "mappin.circle.fill",
                            title: "Find My Representatives",
                            subtitle: "Look up by address",
                            color: .popBlue
                        )
                    }

                    // Email All State Reps
                    Button {
                        selectedReps = Set(SDLegislators.allStateLegislators)
                        showEmailComposer = true
                    } label: {
                        QuickActionRow(
                            icon: "envelope.fill",
                            title: "Email All State Legislators",
                            subtitle: "\(SDLegislators.allStateLegislators.count) recipients",
                            color: .popGold
                        )
                    }

                    // Email Templates
                    Button {
                        showTemplates = true
                    } label: {
                        QuickActionRow(
                            icon: "doc.text.fill",
                            title: "Message Templates",
                            subtitle: "Pre-written messages to customize",
                            color: .green
                        )
                    }
                }
                .padding(.horizontal)

                // US Congress Section
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "U.S. Congress", icon: "flag.fill")

                    ForEach(SDLegislators.usCongressMembers) { rep in
                        RepresentativeRow(
                            rep: rep,
                            isSelected: selectedReps.contains(rep),
                            onSelect: { toggleSelection(rep) },
                            onEmail: { emailSingle(rep) },
                            onCall: { callRep(rep) }
                        )
                    }
                }
                .padding(.horizontal)

                // SD Senate Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        SectionHeader(title: "SD Senate", icon: "building.columns")
                        Spacer()
                        Button("Select All") {
                            SDLegislators.sdSenate.forEach { selectedReps.insert($0) }
                        }
                        .font(.caption)
                        .foregroundColor(.popBlue)
                    }

                    ForEach(SDLegislators.sdSenate) { rep in
                        RepresentativeRow(
                            rep: rep,
                            isSelected: selectedReps.contains(rep),
                            onSelect: { toggleSelection(rep) },
                            onEmail: { emailSingle(rep) },
                            onCall: { callRep(rep) }
                        )
                    }
                }
                .padding(.horizontal)

                // SD House Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        SectionHeader(title: "SD House", icon: "person.3")
                        Spacer()
                        Button("Select All") {
                            SDLegislators.sdHouse.forEach { selectedReps.insert($0) }
                        }
                        .font(.caption)
                        .foregroundColor(.popBlue)
                    }

                    ForEach(SDLegislators.sdHouse) { rep in
                        RepresentativeRow(
                            rep: rep,
                            isSelected: selectedReps.contains(rep),
                            onSelect: { toggleSelection(rep) },
                            onEmail: { emailSingle(rep) },
                            onCall: { callRep(rep) }
                        )
                    }
                }
                .padding(.horizontal)

                // Full Legislature Link
                Link(destination: SDLegislators.legislatureURL) {
                    HStack {
                        Image(systemName: "globe")
                        Text("View All Legislators on sdlegislature.gov")
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

                Spacer(minLength: 100)
            }
        }
        .navigationTitle("Contact Reps")
        .navigationBarTitleDisplayMode(.inline)
        .overlay(alignment: .bottom) {
            // Floating action bar when reps selected
            if !selectedReps.isEmpty {
                SelectedRepsBar(
                    count: selectedReps.count,
                    onEmail: { showEmailComposer = true },
                    onClear: { selectedReps.removeAll() }
                )
            }
        }
        .sheet(isPresented: $showFindByAddress) {
            NavigationStack {
                FindByAddressView()
            }
        }
        .sheet(isPresented: $showTemplates) {
            NavigationStack {
                TemplatesListView(
                    onSelect: { template in
                        selectedTemplate = template
                        showTemplates = false
                        showEmailComposer = true
                    }
                )
            }
        }
        .sheet(isPresented: $showEmailComposer) {
            EmailComposerSheet(
                recipients: Array(selectedReps),
                template: selectedTemplate
            )
        }
    }

    private func toggleSelection(_ rep: Representative) {
        if selectedReps.contains(rep) {
            selectedReps.remove(rep)
        } else {
            selectedReps.insert(rep)
        }
    }

    private func emailSingle(_ rep: Representative) {
        if let url = EmailComposer.composeEmail(to: [rep]) {
            UIApplication.shared.open(url)
        }
    }

    private func callRep(_ rep: Representative) {
        guard let phone = rep.phone,
              let url = URL(string: "tel:\(phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression))") else {
            return
        }
        UIApplication.shared.open(url)
    }
}

// MARK: - Quick Action Row
struct QuickActionRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(color)
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
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

// MARK: - Section Header
struct SectionHeader: View {
    let title: String
    let icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.popGold)
            Text(title)
                .font(.headline)
                .foregroundColor(.popDarkBlue)
        }
    }
}

// MARK: - Representative Row
struct RepresentativeRow: View {
    let rep: Representative
    let isSelected: Bool
    let onSelect: () -> Void
    let onEmail: () -> Void
    let onCall: () -> Void

    var partyColor: Color {
        switch rep.party {
        case .republican: return .red
        case .democrat: return .blue
        case .independent: return .purple
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            // Selection checkbox
            Button(action: onSelect) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .popBlue : .gray)
                    .font(.title3)
            }

            // Rep info
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(rep.name)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.popDarkBlue)

                    Text("(\(rep.party.rawValue))")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(partyColor)
                }

                Text("\(rep.displayTitle) • \(rep.districtDisplay)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            // Action buttons
            HStack(spacing: 8) {
                Button(action: onEmail) {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.popBlue)
                        .frame(width: 36, height: 36)
                        .background(Color.popBlue.opacity(0.1))
                        .cornerRadius(8)
                }

                if rep.phone != nil {
                    Button(action: onCall) {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.green)
                            .frame(width: 36, height: 36)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .background(isSelected ? Color.popBlue.opacity(0.05) : Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Selected Reps Bar
struct SelectedRepsBar: View {
    let count: Int
    let onEmail: () -> Void
    let onClear: () -> Void

    var body: some View {
        HStack {
            Text("\(count) selected")
                .font(.headline)
                .foregroundColor(.white)

            Spacer()

            Button("Clear", action: onClear)
                .foregroundColor(.white.opacity(0.8))

            Button(action: onEmail) {
                HStack {
                    Image(systemName: "envelope.fill")
                    Text("Email All")
                }
                .font(.headline)
                .foregroundColor(.popBlue)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(20)
            }
        }
        .padding()
        .background(Color.popBlue)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 4)
        .padding()
    }
}

// MARK: - Find By Address View
struct FindByAddressView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        WebViewContainer(url: SDLegislators.findMyLegislatorURL)
            .navigationTitle("Find My Legislators")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
    }
}

// MARK: - Templates List View
struct TemplatesListView: View {
    @Environment(\.dismiss) private var dismiss
    let onSelect: (MessageTemplate) -> Void

    var body: some View {
        List {
            ForEach(MessageTemplate.templates) { template in
                Button {
                    onSelect(template)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(template.title)
                            .font(.headline)
                            .foregroundColor(.popDarkBlue)
                        Text(template.subject)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("Message Templates")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Cancel") { dismiss() }
            }
        }
    }
}

// MARK: - Email Composer Sheet
struct EmailComposerSheet: View {
    @Environment(\.dismiss) private var dismiss
    let recipients: [Representative]
    let template: MessageTemplate?

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "envelope.open.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.popBlue)

                Text("Ready to Email")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Sending to \(recipients.count) recipient\(recipients.count == 1 ? "" : "s")")
                    .foregroundColor(.secondary)

                if let template = template {
                    Text("Using template: \(template.title)")
                        .font(.caption)
                        .foregroundColor(.popGold)
                }

                VStack(spacing: 12) {
                    Button {
                        openMailApp()
                    } label: {
                        HStack {
                            Image(systemName: "envelope.fill")
                            Text("Open Mail App")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())

                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.secondary)
                }
                .padding(.top, 20)
            }
            .padding()
            .navigationTitle("Compose Email")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func openMailApp() {
        let subject = template?.subject ?? "Message from a Constituent"
        let body = template?.body ?? ""

        if let url = EmailComposer.composeEmail(to: recipients, subject: subject, body: body) {
            UIApplication.shared.open(url)
            dismiss()
        }
    }
}

#Preview {
    NavigationStack {
        ContactRepsView()
    }
}
