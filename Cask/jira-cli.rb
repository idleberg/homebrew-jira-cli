# typed: true
# frozen_string_literal: true

cask "jira-cli" do
  arch intel: "x86_64"

  version "1.5.0"
  sha256 intel: "8ae2d70196ed89df9235ac327db3b4abc14bddc810791a5efb291b50451ed488"

  url "https://github.com/ankitpokhrel/jira-cli/releases/download/v#{version}/jira_#{version}_macOS_#{arch}.tar.gz"
  name "Jira CLI"
  desc "Feature-rich interactive Jira command-line"
  homepage "https://github.com/ankitpokhrel/jira-cli"

  binary "jira_#{version}_macOS_#{arch}/bin/jira"
end
