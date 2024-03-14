# frozen_string_literal: true

class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.datetime :started_at, null: false, precision: nil
      t.datetime :ended_at, precision: nil
      t.string :activity, null: false
      t.boolean :is_countdown, null: false, default: false

      t.timestamps
    end

    add_index :tracks, :started_at
    add_index :tracks, :ended_at
  end
end
