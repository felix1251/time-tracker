# frozen_string_literal: true

class TrackTimerFormComponent < ViewComponent::Base
  attr_reader :track

  def initialize(track:)
    @track = track
    super
  end
end
