class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: %i[ show edit update destroy ]

  def index
    @tags = current_user.tags
  end

  def show
  end

  def new
    @tag = current_user.tags.new
  end

  def edit
  end

  def create
    @tag = current_user.tags.new(tag_params)

      if @tag.save
        redirect_to @tag, notice: "Tag was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @tag.update(tag_params)
        redirect_to @tag, notice: "Tag was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @tag.destroy
      redirect_to tags_url, notice: "Tag was successfully destroyed."
  end

  private

    def set_tag
      @tag = current_user.tags.find_by(id: params[:id])
      redirect_to(tags_url, alert: "ERROR!!") if @tag.blank?
    end

    def tag_params
      params.require(:tag).permit(:name, :caption)
    end
end
