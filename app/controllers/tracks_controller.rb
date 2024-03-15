# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :set_track, only: %i[show edit update destroy stop_countdown]

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
    @track = current_user.tracks.new(sanitize_track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to track_url(@track), notice: 'Track was successfully created.' }
        format.turbo_stream do
          is_countdown = @track.ended_at.blank?
          message = is_countdown ? 'Successfully stopped' : 'Successfully created'
          render :success, locals: { track: @track, message: }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
          render :error, locals: { message: @track.errors.full_messages.first }
        end
      end
    end
  end

  def stop_countdown
    respond_to do |format|
      if @track.update(ended_at: Time.zone.now)
        format.turbo_stream do
          render :success, locals: { track: Track.new, message: 'Successfully stopped' }
        end
      else
        format.turbo_stream do
          render :error, locals: { message: @track.errors.full_messages.first }
        end
      end
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
    params.require(:track).permit(:activity, :tag_id, :started_at, :ended_at)
  end

  def sanitize_track_params
    params[:track][:started_at] = Time.zone.now if params[:track][:started_at].blank?

    track_params
  end
end
