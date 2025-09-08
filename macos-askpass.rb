class MacosAskpass < Formula
  desc "🔐 Secure sudo authentication for macOS CI/CD and automation"
  homepage "https://github.com/scttfrdmn/macos-askpass"
  url "https://github.com/scttfrdmn/macos-askpass/archive/v1.0.1.tar.gz"
  sha256 "27225471ac8188280c91c391e60b3c3b1fc0bb1fa85826e141364510d3e323fa"
  license "MIT"
  
  depends_on "bash"
  
  def install
    # Install the main binary
    bin.install "bin/askpass"
    
    # Install documentation
    if Dir.exist?("docs")
      doc.install Dir["docs/*"]
    end
    doc.install "README.md" if File.exist?("README.md")
    doc.install "PROJECT-SUMMARY.md" if File.exist?("PROJECT-SUMMARY.md")
    
    # Install examples
    if Dir.exist?("examples")
      (share/"macos-askpass").install Dir["examples/*"]
    end
  end
  
  def caveats
    <<~EOS
      🚀 Getting Started:
        askpass setup          # Interactive configuration
        askpass test           # Test functionality
        askpass help           # Show all commands
      
      💡 Quick Examples:
        # Set up for local development
        askpass setup
        
        # Use with sudo (shows GUI dialog or uses stored credentials)
        export SUDO_ASKPASS=$(which askpass)
        sudo -A echo "Hello, world!"
        
        # CI/CD usage
        export CI_SUDO_PASSWORD="your_password"
        export SUDO_ASKPASS=$(which askpass)
        sudo -A make test
        
        # Force CLI mode (disable GUI dialogs)
        export ASKPASS_FORCE_CLI=1
        sudo -A your-command
      
      📚 Documentation:
        https://github.com/scttfrdmn/macos-askpass
        
      🔐 Security Features:
        • Multi-source authentication (CI vars, keychain, GUI, terminal)
        • Native macOS GUI password dialogs with smart detection
        • macOS Keychain integration for secure storage
        • Zero persistent password files
        • Automatic environment detection (GUI vs CLI)
    EOS
  end
  
  test do
    # Test version command
    assert_match "macOS ASKPASS v1.0.0", shell_output("#{bin}/askpass version")
    
    # Test help command
    assert_match "ASKPASS", shell_output("#{bin}/askpass help")
    
    # Test config command (should not fail)
    system "#{bin}/askpass", "config"
    
    # Test that the script is executable and has proper shebang
    assert_predicate bin/"askpass", :executable?
    assert_match "#!/bin/bash", (bin/"askpass").read
  end
end