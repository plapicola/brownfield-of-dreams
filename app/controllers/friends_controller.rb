# frozen_string_literal: true

# Handles friend request generation, acceptance, and declines for users
class FriendsController < ApplicationController
  def create
    friend_user = User.find_by_uid(params[:friend_uid])
    add_friend(friend_user)
    redirect_to dashboard_path
  end

  def update
    friend_user = User.find_by_id(params[:friend_id])
    add_friend(friend_user)
    redirect_to dashboard_path
  end

  def destroy
    friend_user = User.find_by_id(params[:friend_id])
    Friend.find_by(user: friend_user, friend_user: current_user).destroy
    redirect_to dashboard_path
  end

  private

  def add_friend(friend_user)
    friend_info = { user: current_user, friend_user: friend_user }
    raise StandardError if Friend.find_by(friend_info)

    Friend.create(friend_info)
  rescue StandardError
    flash[:error] = 'Unable to add user as a friend. Please try again.'
  end
end
