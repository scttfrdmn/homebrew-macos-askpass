class MacosAskpass < Formula
  desc "🔐 Secure sudo authentication for macOS CI/CD and automation"
  homepage "https://github.com/scttfrdmn/macos-askpass"
  url "https://github.com/scttfrdmn/macos-askpass/archive/v1.0.0.tar.gz"
  sha256 "548db940aebf088a80a2e62147d37954dc850677602e67870eada1c6586eeed3"
  license "MIT"
  
  depends_on "bash"
  
  def install
    bin.install "bin/askpass"
    
    # Install documentation
    doc.install Dir["docs/*"] if Dir.exist?("docs")
    doc.install "README.md"
    doc.install "PROJECT-SUMMARY.md"
    
    # Install examples
    (share/"macos-askpass").install Dir["examples/*"] if Dir.exist?("examples")
    
    # Install man page equivalent (help text)
    (share/"macos-askpass").install "bin/askpass" => "askpass-help"
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