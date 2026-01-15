//
//  DocumentsView.swift
//  PoP
//
//  Searchable founding documents database
//

import SwiftUI

struct DocumentsView: View {
    @StateObject private var bookmarkManager = BookmarkManager.shared
    @State private var searchText = ""
    @State private var selectedDocument: FoundingDocument?

    var bookmarkedDocuments: [FoundingDocument] {
        bookmarkManager.getBookmarkedDocuments()
    }

    var filteredDocuments: [FoundingDocument] {
        if searchText.isEmpty {
            return FoundingDocuments.all
        }
        return FoundingDocuments.all.filter { doc in
            doc.title.localizedCaseInsensitiveContains(searchText) ||
            doc.content.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                // Bookmarks section
                if !bookmarkedDocuments.isEmpty && searchText.isEmpty {
                    Section("Bookmarks") {
                        ForEach(bookmarkedDocuments) { document in
                            NavigationLink {
                                DocumentDetailView(document: document, searchText: searchText)
                            } label: {
                                DocumentRowView(document: document, isBookmarked: true)
                            }
                        }
                    }
                }

                // All documents section
                Section(searchText.isEmpty ? "All Documents" : "Search Results") {
                    ForEach(filteredDocuments) { document in
                        NavigationLink {
                            DocumentDetailView(document: document, searchText: searchText)
                        } label: {
                            DocumentRowView(
                                document: document,
                                isBookmarked: bookmarkManager.isBookmarked(document.id)
                            )
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Documents")
            .searchable(text: $searchText, prompt: "Search documents")
        }
    }
}

// MARK: - Document Row
struct DocumentRowView: View {
    let document: FoundingDocument
    var isBookmarked: Bool = false

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: document.icon)
                .font(.title2)
                .foregroundColor(.popBlue)
                .frame(width: 44, height: 44)
                .background(Color.popBlue.opacity(0.1))
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(document.title)
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    if isBookmarked {
                        Image(systemName: "bookmark.fill")
                            .font(.caption)
                            .foregroundColor(.popGold)
                    }
                }

                Text(document.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("\(document.year)")
                    .font(.caption)
                    .foregroundColor(.popGold)
                    .fontWeight(.medium)
            }
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Document Detail View
struct DocumentDetailView: View {
    @StateObject private var bookmarkManager = BookmarkManager.shared
    let document: FoundingDocument
    let searchText: String
    @State private var fontSize: CGFloat = 16

    var isBookmarked: Bool {
        bookmarkManager.isBookmarked(document.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text(document.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text(document.subtitle)
                        .font(.title3)
                        .foregroundColor(.secondary)

                    HStack {
                        Label("\(document.year)", systemImage: "calendar")
                        Spacer()
                        Label(document.category, systemImage: document.icon)
                    }
                    .font(.subheadline)
                    .foregroundColor(.popBlue)
                }
                .padding(.bottom, 8)

                Divider()

                // Content
                Text(document.content)
                    .font(.system(size: fontSize))
                    .lineSpacing(6)
                    .foregroundColor(.primary)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    bookmarkManager.toggleBookmark(for: document)
                } label: {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(isBookmarked ? .popGold : .popBlue)
                }

                Button {
                    if fontSize > 12 {
                        fontSize -= 2
                    }
                } label: {
                    Image(systemName: "textformat.size.smaller")
                }

                Button {
                    if fontSize < 24 {
                        fontSize += 2
                    }
                } label: {
                    Image(systemName: "textformat.size.larger")
                }
            }
        }
    }
}

#Preview {
    DocumentsView()
}
