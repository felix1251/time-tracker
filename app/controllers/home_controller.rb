# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tracks = current_user.tracks.order(started_at: :asc).complete
    @countdown = current_user.tracks.countdown.first
    @user_tags = current_user.tags
  end
end
