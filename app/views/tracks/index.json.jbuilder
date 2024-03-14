# frozen_string_literal: true

json.array! @tracks, partial: 'tracks/track', as: :track
