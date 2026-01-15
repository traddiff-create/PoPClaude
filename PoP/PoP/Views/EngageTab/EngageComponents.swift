//
//  EngageComponents.swift
//  PoP
//
//  Shared UI components for the Engage tab features.
//

import SwiftUI

// MARK: - Feature Cards

/// Card for the Engage hub linking to a feature
struct EngageFeatureCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
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

// MARK: - Quiz Components

/// Question counter for quiz progress
struct QuestionCounter: View {
    let current: Int
    let total: Int

    var body: some View {
        Text("Question \(current) of \(total)")
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.secondary)
    }
}

/// Button for quiz answer options
struct QuestionOptionButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.body)
                    .foregroundColor(isSelected ? .white : .popDarkBlue)
                    .multilineTextAlignment(.leading)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.popBlue : Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.popBlue : Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

/// Small badge showing a value with icon
struct ValueBadge: View {
    let name: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.caption)
            Text(name)
                .font(.caption)
                .fontWeight(.medium)
        }
        .foregroundColor(color)
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(color.opacity(0.1))
        .cornerRadius(8)
    }
}

/// Row showing a single value in quiz results
struct ValueResultRow: View {
    let value: CoreValue
    let rank: Int

    var body: some View {
        HStack(spacing: 16) {
            Text("\(rank)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.popGold)
                .frame(width: 30)

            Image(systemName: value.icon)
                .font(.title2)
                .foregroundColor(.popBlue)
                .frame(width: 40)

            VStack(alignment: .leading, spacing: 4) {
                Text(value.name)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
                Text(value.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

/// Card for sharing quiz results
struct ShareableResultsCard: View {
    let topValues: [CoreValue]
    let insight: String

    var body: some View {
        VStack(spacing: 16) {
            Text("My Core Values")
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            HStack(spacing: 12) {
                ForEach(topValues.prefix(3)) { value in
                    VStack(spacing: 8) {
                        Image(systemName: value.icon)
                            .font(.title)
                            .foregroundColor(.popBlue)
                        Text(value.name)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.popDarkBlue)
                    }
                    .frame(maxWidth: .infinity)
                }
            }

            Text(insight)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text("peopleoverpartysd.com")
                .font(.caption2)
                .foregroundColor(.popGold)
        }
        .padding()
        .background(Color.popLightBackground)
        .cornerRadius(16)
    }
}

// MARK: - Section Components

/// Expandable section with disclosure indicator
struct ExpandableSection<Content: View>: View {
    let title: String
    let icon: String?
    @Binding var isExpanded: Bool
    @ViewBuilder let content: () -> Content

    init(title: String, icon: String? = nil, isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.icon = icon
        self._isExpanded = isExpanded
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    if let icon = icon {
                        Image(systemName: icon)
                            .foregroundColor(.popBlue)
                    }
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
                .padding()
                .background(Color.white)
            }
            .buttonStyle(PlainButtonStyle())

            if isExpanded {
                content()
                    .padding(.horizontal)
                    .padding(.bottom)
                    .background(Color.white)
            }
        }
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

/// Row for displaying a tip with icon
struct EngageTipRow: View {
    let icon: String
    let text: String
    var iconColor: Color = .popGold

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .frame(width: 20)
            Text(text)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

/// External link with icon
struct EngageResourceLink: View {
    let name: String
    let url: String
    let description: String?
    var isNonpartisan: Bool = true

    var body: some View {
        Link(destination: URL(string: url)!) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text(name)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.popDarkBlue)
                        if isNonpartisan {
                            Text("Nonpartisan")
                                .font(.caption2)
                                .foregroundColor(.popGold)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.popGold.opacity(0.1))
                                .cornerRadius(4)
                        }
                    }
                    if let description = description {
                        Text(description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }
                }
                Spacer()
                Image(systemName: "arrow.up.right")
                    .foregroundColor(.popBlue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}

// MARK: - Issue Explorer Components

/// Card showing a political perspective
struct PerspectiveCard: View {
    let perspective: IssuePerspective

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(perspective.label)
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            Text(perspective.coreArgument)
                .font(.subheadline)
                .foregroundColor(.primary)

            VStack(alignment: .leading, spacing: 8) {
                Text("Key Points")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.popBlue)

                ForEach(perspective.supportingPoints, id: \.self) { point in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .foregroundColor(.popGold)
                            .padding(.top, 6)
                        Text(point)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }

            Divider()

            VStack(alignment: .leading, spacing: 4) {
                Text("Common Criticism")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                Text(perspective.commonCriticism)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            }

            if let policy = perspective.examplePolicy {
                HStack {
                    Text("Example Policy:")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(policy)
                        .font(.caption)
                        .foregroundColor(.popBlue)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

/// Key term definition row
struct KeyTermRow: View {
    let term: KeyTerm

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(term.term)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.popDarkBlue)
                if let usedBy = term.usedBy {
                    Text(usedBy)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
            Text(term.definition)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.popLightBackground)
        .cornerRadius(8)
    }
}

// MARK: - Reading List Components

/// Card for a book in the reading list
struct BookCard: View {
    let book: Book

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(book.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.popDarkBlue)
                .lineLimit(2)

            Text(book.author)
                .font(.caption)
                .foregroundColor(.secondary)

            Text("\(book.year)")
                .font(.caption2)
                .foregroundColor(.popGold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

/// Card for a podcast resource
struct PodcastCard: View {
    let podcast: PodcastResource

    var body: some View {
        Link(destination: URL(string: podcast.url)!) {
            HStack(spacing: 12) {
                Image(systemName: "mic.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.popBlue)
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 4) {
                    Text(podcast.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.popDarkBlue)
                    Text(podcast.hosts)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(podcast.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }

                Spacer()

                Image(systemName: "arrow.up.right")
                    .foregroundColor(.popBlue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
        }
    }
}

// MARK: - Discussion Guide Components

/// Card for a discussion guide in the list
struct DiscussionGuideCard: View {
    let guide: DiscussionGuide

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: guide.icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .background(Color.popBlue)
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 6) {
                Text(guide.title)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
                Text(guide.subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                        Text(guide.duration)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "person.2")
                        Text(guide.groupSize)
                    }
                }
                .font(.caption2)
                .foregroundColor(.popGold)
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

// MARK: - Event Hosting Components

/// Quick reference card for event hosting
struct QuickReferenceCardView: View {
    let card: QuickReferenceCard

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(card.title)
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            ForEach(card.items, id: \.self) { item in
                Text(item)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 200)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

/// Card for a civic event type
struct EventTypeCard: View {
    let eventType: CivicEventType

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: eventType.icon)
                .font(.title2)
                .foregroundColor(.popBlue)

            Text(eventType.rawValue)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.popDarkBlue)

            Text(eventType.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(3)

            Spacer()

            HStack {
                Image(systemName: "clock")
                Text(eventType.suggestedDuration)
            }
            .font(.caption2)
            .foregroundColor(.popGold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}
