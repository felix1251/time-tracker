# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :user
  has_many :tracks, dependent: :destroy

  validates :name, presence: true
end

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tags_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
