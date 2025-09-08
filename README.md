# Homebrew Tap for macOS ASKPASS

This is the official Homebrew tap for [macOS ASKPASS](https://github.com/scttfrdmn/macos-askpass) - secure sudo authentication for macOS CI/CD and automation.

## 🚀 Installation

```bash
# Add the tap
brew tap scttfrdmn/macos-askpass

# Install askpass
brew install macos-askpass
```

## 🔧 Quick Start

After installation:

```bash
# Interactive setup
askpass setup

# Test functionality  
askpass test

# Use with sudo
export SUDO_ASKPASS=$(which askpass)
sudo -A echo "Hello, world!"
```

## 📖 Documentation

For complete documentation, examples, and integration guides, see:

- **Main Repository**: https://github.com/scttfrdmn/macos-askpass
- **Security Guide**: https://github.com/scttfrdmn/macos-askpass/blob/main/docs/SECURITY.md
- **Integration Examples**: https://github.com/scttfrdmn/macos-askpass/tree/main/examples

## 🐛 Issues & Support

- **Bug Reports**: https://github.com/scttfrdmn/macos-askpass/issues
- **Feature Requests**: https://github.com/scttfrdmn/macos-askpass/issues
- **Discussions**: https://github.com/scttfrdmn/macos-askpass/discussions

## 🤝 Contributing

This tap contains the Homebrew formula for macOS ASKPASS. For contributions to the main project, see the [main repository](https://github.com/scttfrdmn/macos-askpass).

---

**Made with ❤️ for the macOS developer community**