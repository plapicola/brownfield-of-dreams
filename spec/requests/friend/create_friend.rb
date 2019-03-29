require 'rails_helper'

describe 'as user', type: :request do
  it 'I cant send a post to the controller for a friend with invalid user to add' do
    @user = create(:github_user)
    @current_friend = create(:github_user)
    current_friend_1 = Friend.create(user: @user, friend_user: @current_friend)
    current_friend_2 = Friend.create(user: @current_friend, friend_user: @user)
    allow_any_instance_of(ApplicationController).to(
      receive(:current_user).and_return(@user))

    VCR.use_cassette('views/dashboard_github_request') do
      post friends_path("badcredentials")
      end
      binding.pry

    expect(response.redirect_url).to eq(dashboard_url)
  end
end
