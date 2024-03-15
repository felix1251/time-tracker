# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tracks.complete
  end
end
