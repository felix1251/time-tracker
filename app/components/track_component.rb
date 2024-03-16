# frozen_string_literal: true

class TrackComponent < ViewComponent::Base
  delegate :seconds_to_hms, to: :helpers
  attr_reader :track, :tags, :from

  def initialize(track:, from:, tags: [])
    @track = track
    @tags = tags
    @from = from
    super
  end
end
