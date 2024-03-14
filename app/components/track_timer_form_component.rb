# frozen_string_literal: true

class TrackTimerFormComponent < ViewComponent::Base
  attr_reader :track_model

  def initialize(track_model:)
    @track_model = track_model
    super
  end
end
