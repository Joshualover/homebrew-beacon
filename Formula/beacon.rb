class Beacon < Formula
  include Language::Python::Virtualenv

  desc "Beacon - agent-to-agent pings with RTC payments (BoTTube, Moltbook, RustChain, UDP)"
  homepage "https://bottube.ai/skills/beacon"
  url "https://files.pythonhosted.org/packages/source/b/beacon-skill/beacon_skill-0.1.1.tar.gz"
  sha256 ""
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
      Beacon installed! Agent-to-agent pings across 4 transports:

        beacon init                              # Create config
        beacon bottube ping-agent sophia --like   # Like agent's video
        beacon moltbook upvote 12345             # Upvote a post
        beacon rustchain pay RTCabc... 1.5       # Send RTC payment
        beacon udp listen --port 38400           # Listen for LAN beacons

      Docs: https://github.com/Scottcjn/beacon-skill
    EOS
  end

  test do
    system "python3", "-c", "import beacon_skill"
  end
end
