# frozen_string_literal: true

json.extract! track, :id, :user_id, :tag_id, :activity, :created_at, :updated_at
json.url track_url(track, format: :json)
