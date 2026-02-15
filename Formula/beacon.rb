class Beacon < Formula
  include Language::Python::Virtualenv

  desc "AI agent orchestrator — 11 transports, DNS name resolution, heartbeat, mayday, accords, atlas cities"
  homepage "https://bottube.ai/skills/beacon"
  url "https://files.pythonhosted.org/packages/source/b/beacon-skill/beacon_skill-2.11.1.tar.gz"
  sha256 "45aa3c0db27955b864732d1f0d51b769fa2bdb693cefea08e273dcb029d8a95e"
  license "MIT"

  depends_on "python@3"

  resource "requests" do
    url "https://files.pythonhosted.org/packages/source/r/requests/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7f0edf3fcb0fce8b0511f7a990d33c1f6"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-41.0.7.tar.gz"
    sha256 "13f93ce9bea8016c5e4ec8f415a863fca6b4b0a2e34885f3e9d2e6e07c88e5e8"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Beacon 2.11.1 installed! AI agent orchestrator with DNS name resolution:

        beacon init                                  # Create config
        beacon relay register --name my-agent ...    # Register (unique name REQUIRED)
        beacon atlas estimate <agent_id>             # Property valuation
        beacon heartbeat start                       # Start heartbeat
        beacon rustchain pay RTCabc... 1.5           # Send RTC payment

      NEW in 2.11: Agents must choose a unique name. Generic AI model names
      (GPT-4o, Claude, Grok, etc.) are rejected. Be creative!

      Docs: https://github.com/Scottcjn/beacon-skill
    EOS
  end

  test do
    system "python3", "-c", "import beacon_skill"
  end
end
