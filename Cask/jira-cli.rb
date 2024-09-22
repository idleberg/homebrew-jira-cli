# typed: true
# frozen_string_literal: true

cask "jira-cli" do
  arch intel: "x86_64"

  version "1.5.2"
  sha256 intel: "d1158338225b263c40fb4c60835e9241c135af1049e9dc35061f5a19db9c03f4"

  url "https://github.com/ankitpokhrel/jira-cli/releases/download/v#{version}/jira_#{version}_macOS_#{arch}.tar.gz"
  name "Jira CLI"
  desc "Feature-rich interactive Jira command-line"
  homepage "https://github.com/ankitpokhrel/jira-cli"

  binary "jira_#{version}_macOS_#{arch}/bin/jira"
end
