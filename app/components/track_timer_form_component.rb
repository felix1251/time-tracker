# frozen_string_literal: true

class TrackTimerFormComponent < ViewComponent::Base
  delegate :time_diff, to: :helpers
  attr_reader :track, :tags

  def initialize(track:, tags:)
    @track = track
    @tags = tags
    super
  end
end
