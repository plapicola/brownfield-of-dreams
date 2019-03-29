# frozen_string_literal: true

# PORO to hold information about return information from GitHub API
class GithubUser
  attr_reader :handle,
              :url,
              :uid
  def initialize(attributes)
    @handle = attributes[:login]
    @url = attributes[:html_url]
    @uid = attributes[:id]
  end

  def friendable?(user)
    this_user = User.find_by(uid: @uid)
    # If the github user exists and they haven't been friended by current_user
    this_user ? !user.friend_users.include?(this_user) : false
  end
end
