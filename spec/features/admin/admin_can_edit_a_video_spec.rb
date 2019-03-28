require 'rails_helper'

describe 'Editing a video', :js do
  context 'as an admin' do
    before :each do
      @user = create(:admin)
      @video_1 = create(:video)
      @video_2 = create(:video)
      allow_any_instance_of(ApplicationController).to(
        receive(:current_user).and_return(@user)
      )
    end

    it 'I can edit an existing video within the system' do
      visit edit_admin_tutorial_path(@video_1.tutorial)

      within(page.find_all('.video')[0]) do
        click_button 'Edit Video'
      end

      expect(current_path).to eq(edit_admin_video_path(@video_1))

      fill_in 'video[title]', with: 'New Title'
      fill_in 'video[description]', with: 'A new description!'

      click_button 'Update Video'

      expect(current_path).to eq(edit_admin_tutorial_path(@video_1.tutorial))

      within(page.find_all('.video')[0]) do
        expect(page).to have_content('New Title')
      end
    end
  end
end
