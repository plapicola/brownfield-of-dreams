require 'rails_helper'

describe 'About Page' do
  it 'shows information about the application' do
    visit about_path

    paragraph = "This application is designed to pull in youtube information to" +
                " populate tutorials from Turing School of Software and " +
                "Design's youtube channel. It's designed for anyone learning " +
                "how to code, with additional features for current students."

    expect(page).to have_content 'Turing Tutorials'
    expect(page).to have_content paragraph
  end
end
