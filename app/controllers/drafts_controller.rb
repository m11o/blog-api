class DraftsController < ApplicationController
  before_action :set_draft, only: %i[show update destroy]

  # GET /drafts
  def index
    @drafts = Draft.all

    render json: @drafts
  end

  # GET /drafts/1
  def show
    render json: @draft
  end

  # POST /drafts
  def create
    @draft = Draft.new(draft_params)

    if @draft.save
      render json: @draft, status: :created, location: @draft
    else
      render json: @draft.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drafts/1
  def update
    if @draft.update(draft_params)
      render json: @draft
    else
      render json: @draft.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drafts/1
  def destroy
    @draft.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_draft
    @draft = Draft.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def draft_params
    params.fetch(:draft, {})
  end
end
