//
//  ContentView.swift
//  PoP
//
//  Main TabView for People Over Party app
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LearnView()
                .tabItem {
                    Label("Learn", systemImage: "brain.head.profile")
                }

            SouthDakotaView()
                .tabItem {
                    Label("South Dakota", systemImage: "building.columns")
                }

            DocumentsView()
                .tabItem {
                    Label("Documents", systemImage: "doc.text")
                }

            VoteView()
                .tabItem {
                    Label("Vote", systemImage: "checkmark.circle")
                }

            ConnectView()
                .tabItem {
                    Label("Connect", systemImage: "person.2")
                }

            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
        .tint(.popBlue)
    }
}

#Preview {
    ContentView()
}
