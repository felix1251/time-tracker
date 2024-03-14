# frozen_string_literal: true

class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.datetime :started_at, null: false
      t.datetime :ended_at, null: false
      t.string :activity, null: false

      t.timestamps
    end
  end
end
