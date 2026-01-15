//
//  EventCheckInView.swift
//  PoP
//
//  Event check-in for volunteers - enter event code to mark attendance
//

import SwiftUI

struct EventCheckInView: View {
    @StateObject private var checkInManager = CheckInManager.shared
    @State private var eventCode = ""
    @State private var volunteerName = ""
    @State private var showSuccess = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var showHistory = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.green)

                    Text("Event Check-In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("Enter the event code to mark your attendance")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)

                // Check-In Form
                VStack(spacing: 20) {
                    // Event Code Input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Event Code")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.popDarkBlue)

                        TextField("Enter 4-digit code", text: $eventCode)
                            .keyboardType(.numberPad)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.popLightBackground)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.popBlue.opacity(0.3), lineWidth: 1)
                            )
                            .onChange(of: eventCode) { _, newValue in
                                // Limit to 4 digits
                                if newValue.count > 4 {
                                    eventCode = String(newValue.prefix(4))
                                }
                            }
                    }

                    // Name Input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Your Name")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.popDarkBlue)

                        TextField("Enter your name", text: $volunteerName)
                            .padding()
                            .background(Color.popLightBackground)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.popBlue.opacity(0.3), lineWidth: 1)
                            )
                    }

                    // Check-In Button
                    Button {
                        performCheckIn()
                    } label: {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Check In")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(canCheckIn ? Color.green : Color.gray)
                        .cornerRadius(12)
                    }
                    .disabled(!canCheckIn)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
                .padding(.horizontal)

                // Recent Check-Ins
                if !checkInManager.recentCheckIns.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Recent Check-Ins")
                                .font(.headline)
                                .foregroundColor(.popDarkBlue)

                            Spacer()

                            Button {
                                showHistory = true
                            } label: {
                                Text("See All")
                                    .font(.subheadline)
                                    .foregroundColor(.popBlue)
                            }
                        }

                        ForEach(checkInManager.recentCheckIns.prefix(3)) { checkIn in
                            CheckInRow(checkIn: checkIn)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
                    .padding(.horizontal)
                }

                // Info
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.popBlue)
                        Text("How It Works")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.popDarkBlue)
                    }

                    Text("Event organizers will provide a 4-digit code at the event. Enter it here along with your name to record your attendance. Your check-ins help us track volunteer participation.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.popBlue.opacity(0.05))
                .cornerRadius(12)
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Check-In")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Checked In!", isPresented: $showSuccess) {
            Button("OK", role: .cancel) {
                eventCode = ""
                volunteerName = ""
            }
        } message: {
            Text("Thanks for volunteering! Your attendance has been recorded.")
        }
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(errorMessage)
        }
        .sheet(isPresented: $showHistory) {
            NavigationStack {
                CheckInHistoryView()
            }
        }
    }

    private var canCheckIn: Bool {
        eventCode.count == 4 && !volunteerName.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private func performCheckIn() {
        guard canCheckIn else { return }

        // For now, we'll use a generic event name since we don't have a backend
        // In the future, the event code could map to a specific event
        let eventName = "Event #\(eventCode)"

        checkInManager.checkIn(
            eventCode: eventCode,
            eventName: eventName,
            volunteerName: volunteerName.trimmingCharacters(in: .whitespaces)
        )

        showSuccess = true
    }
}

// MARK: - Check-In Row
struct CheckInRow: View {
    let checkIn: EventCheckIn

    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)

            VStack(alignment: .leading, spacing: 2) {
                Text(checkIn.eventName ?? "Event")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.popDarkBlue)

                Text(checkIn.formattedDate)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text("Code: \(checkIn.eventCode ?? "")")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Check-In History View
struct CheckInHistoryView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var checkInManager = CheckInManager.shared

    var body: some View {
        List {
            if checkInManager.allCheckIns.isEmpty {
                Text("No check-ins yet")
                    .foregroundColor(.secondary)
            } else {
                ForEach(checkInManager.allCheckIns) { checkIn in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(checkIn.eventName ?? "Event")
                            .font(.headline)
                            .foregroundColor(.popDarkBlue)

                        HStack {
                            Text("Code: \(checkIn.eventCode ?? "")")
                            Spacer()
                            Text(checkIn.formattedDate)
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)

                        Text("Volunteer: \(checkIn.volunteerName ?? "")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("Check-In History")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") { dismiss() }
            }

            ToolbarItem(placement: .navigationBarLeading) {
                if !checkInManager.allCheckIns.isEmpty {
                    ShareLink(item: checkInManager.exportToCSV()) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EventCheckInView()
    }
}
