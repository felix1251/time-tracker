# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :user
  belongs_to :tag
end

# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  activity   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tracks_on_tag_id   (tag_id)
#  index_tracks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (user_id => users.id)
#
