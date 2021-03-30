class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :her_index]
  before_action :set_tag, only: %i[ edit update destroy ]

  def her_index
    @user = User.find_by(id: params[:id])
    @tags = @user.tags.page(params[:page]).per(2)
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    @posts = @tag.posts.page(params[:page]).per(6)
    @articles = @tag.articles.page(params[:page]).per(6)
  end

  def new
    @tag = current_user.tags.new
  end

  def edit
  end

  def create
    @tag = current_user.tags.new(tag_params)

      if @tag.save
        redirect_to @tag, notice: "タグを新規作成しました"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @tag.update(tag_params)
        redirect_to @tag, notice: "タグの情報を更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @tag.destroy
      redirect_to her_tags_path(current_user.id), notice: "タグを削除しました"
  end

  private

    def set_tag
      @tag = current_user.tags.find_by(id: params[:id])
      redirect_to(root_path, alert: "error") if @tag.blank?
    end

    def tag_params
      params.require(:tag).permit(:name, :caption)
    end
end
