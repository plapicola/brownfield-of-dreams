# Brownfield Of Dreams
Project Completed By: Peter Lapicola and Ty Mazey
Project used at Turing School of Software & Design.

Project Spec and Evaluation Rubric: https://github.com/turingschool-examples/brownfield-of-dreams

### Project Board

Project was to build on the existing code base using the cards within the following Github Project: https://github.com/turingschool-examples/brownfield-of-dreams/projects/1

### About the Project

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

## Heroku Navigation
You can visit a live demo of the app at : heroku

You can register an account by clicking register at the top right hand of the page.

You will receive a verification email with a link to verify your account before receiving access to the 'User Dashboard'

Once at the dashboard you can connect your Github account to your account using OAuth. This will give you access to see 5 of your Github repos on your dashboard, as well as a list of your Followers and who you Follow on Github.

Next to each user you will see a link to invite them to the website, this will send the user an email with an invitation to register an account with the app.

If any of your Github connections are registered with the site there will be an option to send them a friend request next to there name.
By sending a friend request this user will now have an invitation from you on there dashboard wich they can accept or deny. By accepting the friend request you will see eachother listed in the Friend List section on the Dashboard.

You are free to navigate the site by looking at tutorials which will have a list of different Videos associated with them connected to youtube. You can bookmark a video by clicking 'Bookmark' above the video. The video title will now show in your Bookmarks on your dashboard. The bookmark function uses JavaScript to keep the page and video from refreshing when bookmarking.

Admins have the ability to make new, edit or delete tutorials.
You can Log In as an admin by using:

email: admin@example.com
password: password

## Local Setup
For testing or localhost:3000

You will need to run install figaro once bundle is run and add,
- ENV['YOUTUBE_API_KEY']
- ENV['GITHUB_API_KEY']
- ENV['ALT_GITHUB_API_KEY']
- ENV['OAUTH_CLIENT_ID']
- ENV['OAUTH_CLIENT_SECERET']
- ENV['USER_EMAIL']
Define anything for each key and the test will use VCR to pass the rest.

You will also need to install MailCatcher
```
gem install mailcatcher
```
and run
```
mailcatcher
```
Before running the test, or localhost.

You can 'check' your emails by visiting localhost:1080

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Run the test suite:
```ruby
$ bundle exec rspec
```

## Technologies
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)

### Versions
* Ruby 2.4.1
* Rails 5.2.0
