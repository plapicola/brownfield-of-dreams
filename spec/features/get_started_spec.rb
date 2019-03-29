# frozen_string_literal: true

require 'rails_helper'

describe 'Get Started' do
  it 'shows information about how to interact with the application' do
    visit get_started_path

    filter_text = 'Filter results by selecting a filter on the side bar ' \
                  'of the homepage.'

    sign_in_text = 'Sign in with census if you are a current student for ' \
                   'additional content.'

    expect(page).to have_content 'Browse tutorials from the homepage.'
    expect(page).to have_content filter_text
    expect(page).to have_content 'Register to bookmark segments.'
    expect(page).to have_content sign_in_text
  end

  it 'links to the sign in page' do
    visit get_started_path

    click_link 'Sign in'

    expect(current_path).to eq(login_path)
  end

  it 'links to the homepage' do
    visit get_started_path

    within (page.find_all('li')[0]) do
      click_link 'homepage'
    end

    expect(current_path).to eq(root_path)

    visit get_started_path

    within (page.find_all('li')[1]) do
      click_link 'homepage'
    end

    expect(current_path).to eq(root_path)
  end
end
