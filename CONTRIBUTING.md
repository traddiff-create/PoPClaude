# Contributing to PoP - People Over Party

Thank you for your interest in contributing to People Over Party! This project aims to make civic engagement accessible to everyone.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- A clear, descriptive title
- Steps to reproduce the problem
- Expected vs. actual behavior
- iOS version and device type
- Screenshots if applicable

### Suggesting Features

We welcome feature suggestions! Please open an issue with:
- A clear description of the feature
- Why it would benefit users
- Any implementation ideas you have

### Code Contributions

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
   - Follow the existing code style
   - Add comments for complex logic
   - Test on iOS Simulator
4. **Commit with clear messages**
   ```bash
   git commit -m "Add: brief description of changes"
   ```
5. **Push and create a Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

### Pull Request Guidelines

- Keep changes focused and atomic
- Update documentation if needed
- Ensure the app builds without warnings
- Test on multiple device sizes (iPhone, iPad)
- Reference any related issues

## Code Style

### Swift
- Use SwiftUI for all new views
- Follow Apple's [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Use meaningful variable and function names
- Keep functions small and focused

### File Organization
- Views go in `Views/` organized by tab
- Data models go in `Data/`
- Manager classes go in `Managers/`
- Shared styles go in `Theme.swift`

### Comments
- Add comments for non-obvious logic
- Use `// MARK: -` to organize sections
- Document public functions and properties

## Areas We Need Help

### High Priority
- **State Adaptations** - Help us create templates for more states
- **Accessibility** - VoiceOver support, Dynamic Type
- **Testing** - Unit tests for managers and data logic

### Medium Priority
- **Localization** - Spanish and other language support
- **Performance** - Optimize large document rendering
- **UI Polish** - Animations, transitions, dark mode refinements

### Low Priority
- **Documentation** - Improve code comments and guides
- **Analytics** - Privacy-respecting usage insights
- **Android Version** - Port to Kotlin/Jetpack Compose

## Development Setup

### Requirements
- macOS Sonoma or later
- Xcode 15.0+
- iOS 17.0+ Simulator

### Getting Started
```bash
git clone https://github.com/yourusername/PoP.git
cd PoP
open PoP/PoP.xcodeproj
```

Select a simulator (iPhone 17 Pro Max recommended) and press Cmd+R to build and run.

## Community

- Be respectful and constructive
- Follow our [Code of Conduct](CODE_OF_CONDUCT.md)
- Help newcomers get started
- Celebrate contributions of all sizes

## Questions?

- Open an issue for technical questions
- Email hello@peopleoverpartysd.com for general inquiries
- Visit [peopleoverpartysd.com](https://www.peopleoverpartysd.com/) for more about the organization

---

Thank you for helping make civic engagement accessible to everyone!
