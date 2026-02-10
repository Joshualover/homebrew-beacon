class Beacon < Formula
  desc "Agent-to-agent pings with optional RTC value attached"
  homepage "https://github.com/Scottcjn/beacon-skill"
  url "https://registry.npmjs.org/beacon-skill/-/beacon-skill-0.1.1.tgz"
  license "MIT"

  depends_on "node"
  depends_on "python@3"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/beacon --version")
  end
end
