# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tracks = current_user.tracks.order(started_at: :asc).complete
  end
end
