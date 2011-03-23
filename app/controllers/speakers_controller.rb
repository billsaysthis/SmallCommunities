class SpeakersController < ApplicationController
  def past_speakers
    @speakers = Speakers.past
    @context_title = t(:past_speakers_link)
    @sponsors = User.active_public
  end
end