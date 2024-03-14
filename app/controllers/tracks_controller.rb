# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :set_track, only: %i[show edit update destroy]

  # GET /tracks or /tracks.json
  def index
    @tracks = Track.all
  end

  # GET /tracks/1 or /tracks/1.json
  def show; end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit; end

  # POST /tracks or /tracks.json
  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track), notice: 'Track was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  def update
    if @track.update(track_params)
      redirect_to track_url(@track), notice: 'Track was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  def destroy
    @track.destroy

    redirect_to tracks_url, notice: 'Track was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_track
    @track = Track.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def track_params
    params.require(:track).permit(:user_id, :tag_id, :activity)
  end
end
