# typed: true
# frozen_string_literal: true

cask "jira-cli" do
  arch intel: "x86_64"

  version "1.5.1"
  sha256 intel: "6f2331700d48bebebe6b6bece3bda839fa30e43b5b145062ac0eb94c3f9b51db"

  url "https://github.com/ankitpokhrel/jira-cli/releases/download/v#{version}/jira_#{version}_macOS_#{arch}.tar.gz"
  name "Jira CLI"
  desc "Feature-rich interactive Jira command-line"
  homepage "https://github.com/ankitpokhrel/jira-cli"

  binary "jira_#{version}_macOS_#{arch}/bin/jira"
end
