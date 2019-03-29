require 'rails_helper'

describe YouTube::Video do
  it 'exists' do
    VCR.use_cassette("An_Admin_can_edit_a_tutorial/by_adding_a_video") do
      video = YouTube::Video.new(YoutubeService.new.video_info("J7ikFUlkP_k"))

      expect(video).to be_a(YouTube::Video)
    end
  end

  it 'can find videos by video_id' do
    VCR.use_cassette("An_Admin_can_edit_a_tutorial/by_adding_a_video") do
      video = YouTube::Video.by_id("J7ikFUlkP_k")

      expect(video).to be_a(YouTube::Video)
      expect(video.thumbnail).to eq("https://i.ytimg.com/vi/J7ikFUlkP_k/hqdefault.jpg")
    end
  end
end
