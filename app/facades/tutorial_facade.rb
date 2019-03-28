# frozen_string_literal: true

class TutorialFacade < SimpleDelegator
  def initialize(tutorial, video_id = nil)
    super(tutorial)
    @video = Video.find_by(id: video_id) || videos.first
  end

  def current_video
    @video || Video.new
  end

  def next_video
    videos[current_video_index + 1] || current_video
  end

  def play_next_video?
    current_video.position < maximum_video_position
  end

  def player_partial
    videos.empty? ? 'empty_tutorial' : 'player'
  end

  private

  def current_video_index
    videos.index(current_video) || 0
  end

  def maximum_video_position
    videos.max_by(&:position).position
  end
end
