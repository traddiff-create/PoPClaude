//
//  Theme.swift
//  PoP
//
//  People Over Party - Brand Theme System
//

import SwiftUI

// MARK: - Brand Colors
extension Color {
    // Primary brand colors from Better Together logo
    static let popBlue = Color(red: 0.102, green: 0.482, blue: 0.659)       // #1A7BA8
    static let popGold = Color(red: 0.910, green: 0.659, blue: 0.196)       // #E8A832
    static let popDarkBlue = Color(red: 0.051, green: 0.239, blue: 0.329)   // #0D3D54

    // Background colors
    static let popLightBackground = Color(red: 0.961, green: 0.961, blue: 0.961) // #F5F5F5
    static let popDarkBackground = Color(red: 0.067, green: 0.114, blue: 0.149)  // #111D26

    // Semantic colors
    static let popAccent = popGold
    static let popPrimary = popBlue
}

// MARK: - Theme Environment
struct PopTheme {
    let primary: Color
    let accent: Color
    let background: Color
    let secondaryBackground: Color
    let text: Color
    let secondaryText: Color
    let cardBackground: Color

    static let light = PopTheme(
        primary: .popBlue,
        accent: .popGold,
        background: .popLightBackground,
        secondaryBackground: .white,
        text: .popDarkBlue,
        secondaryText: .gray,
        cardBackground: .white
    )

    static let dark = PopTheme(
        primary: .popBlue,
        accent: .popGold,
        background: .popDarkBackground,
        secondaryBackground: Color(white: 0.15),
        text: .white,
        secondaryText: .gray,
        cardBackground: Color(white: 0.12)
    )
}

// MARK: - Custom Button Styles
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.popBlue)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.popBlue)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.popBlue.opacity(0.1))
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct GoldButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.popDarkBlue)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.popGold)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Card Style Modifier
struct CardStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .background(colorScheme == .dark ? Color(white: 0.12) : .white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.3 : 0.08), radius: 8, x: 0, y: 2)
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(CardStyle())
    }
}

// MARK: - Header Style
struct SectionHeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.popDarkBlue)
    }
}

extension View {
    func sectionHeader() -> some View {
        modifier(SectionHeaderStyle())
    }
}
