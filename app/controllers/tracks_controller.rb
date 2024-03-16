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
    @track = current_user.tracks.new(sanitize_track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to track_url(@track), notice: 'Track was successfully created.' }
        format.turbo_stream do
          is_countdown = @track.countdown?
          message = is_countdown ? 'Successfully started' : 'Successfully created'
          render :success, locals: { track: @track, message:, from: nil }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
          render :error, locals: { message: @track.errors.full_messages.first }
        end
      end
    end
  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(sanitize_track_params)
        message = @is_stopped ? 'Successfully stopped' : 'Successfully updated'
        from =  @is_stopped ? nil : sanitize_track_params[:from]
        format.turbo_stream do
          render :success, locals: { track: @track, message:, from: }
        end
      else
        format.turbo_stream do
          render :error, locals: { message: @track.errors.full_messages.first }
        end
      end
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  def destroy
    respond_to do |format|
      @track.destroy

      format.turbo_stream do
        render :removed
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_track
    @track = Track.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def track_params
    params.require(:track).permit(:activity, :tag_id, :started_at, :ended_at, :from)
  end

  def sanitize_track_params
    params[:track][:started_at] = Time.zone.now if action_name == 'create' && params[:track][:started_at].blank?

    if action_name == 'update' && params[:track][:ended_at].blank?
      @is_stopped = true
      params[:track][:ended_at] = Time.zone.now
    end

    track_params
  end
end
