class DraftTagsController < ApplicationController
  before_action :set_draft_tag, only: %i[show update destroy]

  # GET /draft_tags
  def index
    @draft_tags = DraftTag.all

    render json: @draft_tags
  end

  # GET /draft_tags/1
  def show
    render json: @draft_tag
  end

  # POST /draft_tags
  def create
    @draft_tag = DraftTag.new(draft_tag_params)

    if @draft_tag.save
      render json: @draft_tag, status: :created, location: @draft_tag
    else
      render json: @draft_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /draft_tags/1
  def update
    if @draft_tag.update(draft_tag_params)
      render json: @draft_tag
    else
      render json: @draft_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /draft_tags/1
  def destroy
    @draft_tag.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_draft_tag
    @draft_tag = DraftTag.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def draft_tag_params
    params.fetch(:draft_tag, {})
  end
end
