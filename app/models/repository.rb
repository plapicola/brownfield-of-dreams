# frozen_string_literal: true

# PORO for storing repository information from GitHub API
class Repository
  attr_reader :name,
              :url

  def initialize(repo_attributes)
    @name = repo_attributes[:name]
    @url = repo_attributes[:html_url]
  end
end
