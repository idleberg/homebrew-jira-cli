# typed: true
# frozen_string_literal: true

cask "jira-cli" do
  arch intel: "x86_64"

  version "1.4.0"
  sha256 intel: "00dfed65840bc399cdf55e598d0d85d24de0f070be3803c0801b2bb8f7c372a9"

  url "https://github.com/ankitpokhrel/jira-cli/releases/download/v#{version}/jira_#{version}_macOS_#{arch}.tar.gz"
  name "Jira CLI"
  desc "Feature-rich interactive Jira command-line"
  homepage "https://github.com/ankitpokhrel/jira-cli"

  binary "jira_#{version}_macOS_#{arch}/bin/jira"
end
