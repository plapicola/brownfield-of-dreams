# frozen_string_literal: true

require 'rails_helper'

describe 'A registered user', :js do
  it 'can add videos to their bookmarks' do
    tutorial = create(:tutorial, title: 'How to Tie Your Shoes')
    video = create(:video, title: 'The Bunny Ears Technique', tutorial: tutorial)
    user = create(:user)
    # binding.pry

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    click_button 'Bookmark'

    expect(page).to have_content("You've successfully bookmarked the video!")
  end

  it "can't add the same bookmark more than once" do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    click_on 'Bookmark'
    expect(page).to have_content("You've successfully bookmarked the video!")
    click_on 'Bookmark'
    expect(page).to have_content("You have already bookmarked this video.")
  end

  it 'shows me videos i have Bookmarked on my dashboard' do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)
    user = create(:user)
    create(:user_video, user_id: user.id, video_id: video.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    within '#bookmarks' do
      expect(page).to have_content('Bookmarked Segments')
      expect(page).to have_css('.video', count: 1)
      expect(page).to have_content(video.title)
    end
  end

  it 'does not show me videos a bookmark section if i have no bookmarks' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    within '#bookmarks' do
      expect(page).to have_content('You Have No Bookmarks')
    end
  end
end
