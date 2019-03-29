# frozen_string_literal: true

require 'rails_helper'

describe'when I visit my dashboard' do
  context 'as a user' do
    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      allow_any_instance_of(User).to receive(:github_token).and_return(ENV['GITHUB_API_KEY'])
    end

    it 'I see a section for github' do
      VCR.use_cassette('views/dashboard_github_request') do
        visit dashboard_path

        within '#github' do
          expect(page).to have_content('Github')
        end
      end
    end

    it 'Within the github section I see a list of five repos linking to github' do
      VCR.use_cassette('views/dashboard_github_request') do
        visit dashboard_path

        within '#github' do
          expect(page).to have_css('.repo', count: 5)
          expect(page).to have_link('battleship', href: 'https://github.com/JennicaStiehl/battleship')
          expect(page).to have_link 'little_shop'
          expect(page).to have_link 'brownfield-of-dreams'
        end
      end
    end

    it 'users see repos based on there github token' do
      VCR.use_cassette('views/alt_user_dashboard_github_request') do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(User).to receive(:github_token).and_return(ENV['ALT_GITHUB_API_KEY'])
        visit dashboard_path

        within '#github' do
          expect(page).to have_css('.repo', count: 5)
          expect(page).to_not have_link('battleship', href: 'https://github.com/JennicaStiehl/battleship')
          expect(page).to have_link('activerecord-obstacle-course', href: 'https://github.com/plapicola/activerecord-obstacle-course')
        end
      end
    end

    it 'shows me a list of users who follow me' do
      VCR.use_cassette('views/dashboard_github_request') do
        visit dashboard_path

        within '#github' do
          expect(page).to have_content('Followers')

          within '#followers' do
            expect(page).to have_css('.follower')
            expect(page).to have_link('plapicola', href: 'https://github.com/plapicola')
            expect(page).to have_link('m-mrcr')
            expect(page).to have_link('n-flint')
          end
        end
      end
    end

    it 'shows me a list of users I follow' do
      VCR.use_cassette('views/dashboard_github_request') do
        visit dashboard_path

        within '#github' do
          expect(page).to have_content('Following')

          within '#followed' do
            expect(page).to have_css('.followed-user')
            expect(page).to have_link('teresa-m-knowles', href: 'https://github.com/teresa-m-knowles')
            expect(page).to have_link('n-flint')
            expect(page).to have_link('plapicola')
          end
        end
      end
    end
  end
end
