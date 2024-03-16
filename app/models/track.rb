# frozen_string_literal: true

class Track < ApplicationRecord
  attr_accessor :from

  belongs_to :user
  belongs_to :tag

  scope :complete, -> { where.not(ended_at: nil) }
  scope :countdown, -> { where(ended_at: nil) }

  validates :started_at, presence: true
  validates :activity, presence: true

  validates :started_at, comparison: { less_than_or_equal_to: :ended_at }, if: :ended_at

  before_save :capture_total_hour, if: :ended_at

  def countdown?
    ended_at.blank?
  end

  # use for grouping tracks
  def date_started
    started_at.strftime('%d/%m/%Y')
  end

  private

  def capture_total_hour
    self.total_seconds = ended_at.to_i - started_at.to_i
  end
end

# == Schema Information
#
# Table name: tracks
#
#  id            :bigint           not null, primary key
#  activity      :string           not null
#  ended_at      :datetime
#  started_at    :datetime         not null
#  total_seconds :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tag_id        :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_tracks_on_ended_at    (ended_at)
#  index_tracks_on_started_at  (started_at)
#  index_tracks_on_tag_id      (tag_id)
#  index_tracks_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (user_id => users.id)
#
