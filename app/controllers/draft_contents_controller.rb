class DraftContentsController < ApplicationController
  before_action :set_draft_content, only: %i[show update destroy]

  # GET /draft_contents
  def index
    @draft_contents = DraftContent.all

    render json: @draft_contents
  end

  # GET /draft_contents/1
  def show
    render json: @draft_content
  end

  # POST /draft_contents
  def create
    @draft_content = DraftContent.new(draft_content_params)

    if @draft_content.save
      render json: @draft_content, status: :created, location: @draft_content
    else
      render json: @draft_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /draft_contents/1
  def update
    if @draft_content.update(draft_content_params)
      render json: @draft_content
    else
      render json: @draft_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /draft_contents/1
  def destroy
    @draft_content.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_draft_content
    @draft_content = DraftContent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def draft_content_params
    params.fetch(:draft_content, {})
  end
end
