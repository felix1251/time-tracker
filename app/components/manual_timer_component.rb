# frozen_string_literal: true

class ManualTimerComponent < ViewComponent::Base
  delegate :current_user, :time_diff, to: :helpers
  attr_reader :tags

  def initialize(tags:)
    @tags = tags
    super
  end
end
