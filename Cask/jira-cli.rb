# typed: true
# frozen_string_literal: true

cask "jira-cli" do
  arch intel: "x86_64"

  version "1.6.0"
  sha256 intel: "8c6b20d1c3b4a8a09ef85347d8de656ce38da26170727a15660951011487a6ca"

  url "https://github.com/ankitpokhrel/jira-cli/releases/download/v#{version}/jira_#{version}_macOS_#{arch}.tar.gz"
  name "Jira CLI"
  desc "Feature-rich interactive Jira command-line"
  homepage "https://github.com/ankitpokhrel/jira-cli"

  binary "jira_#{version}_macOS_#{arch}/bin/jira"
end
