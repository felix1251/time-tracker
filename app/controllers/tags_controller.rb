# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :set_tag, only: %i[update destroy]

  def index
    @tags = current_user.tags
  end

  def create
    @track = current_user.tags.new(tag_params)

    if @track.save
      redirect_to tags_url, notice: 'Tag was successfully created.'
    else
      redirect_to tags_url, error: 'Error creating tag', status: :unprocessable_entity
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_url, notice: 'Tag was successfully updated.'
    else
      redirect_to tags_url, error: 'Error updating tag', status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy

    redirect_to tags_url, notice: 'Tag was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tag_params
    params.require(:tag).permit(:name)
  end
end
