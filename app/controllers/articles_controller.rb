class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, only: %i[ edit update destroy ]
  PER = 12
  
  def index
    @articles = Article.all.page(params[:page]).per(PER)
  end

  def her_index
    @user = User.find_by(id: params[:id])
    @articles = @user.articles.page(params[:page]).per(PER)
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def new
    @article = current_user.articles.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)

      if @article.save
        redirect_to @article, notice: "Article was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @article.update(article_params)
        redirect_to @article, notice: "Article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @article.destroy
      redirect_to her_articles_path(current_user.id), notice: "Article was successfully destroyed."
  end

  private
    def set_article
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to(root_path, alert: "ERROR!!") if @article.blank?
    end

    def article_params
      params.require(:article).permit(:title, :body, :tag_id, :photo, :photo_cache, :remove_photo)
    end
    
    
end
