class SpeakersController < ApplicationController
  def past_speakers
    @speakers = Speaker.past
    @context_title = t(:past_speakers_link)
    @sponsors = User.current_sponsors
  end
end