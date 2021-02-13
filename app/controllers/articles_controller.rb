class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[ show edit update destroy ]
  PER = 2

  def index
    @articles = current_user.articles.page(params[:page]).per(PER)
  end

  def show
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
      redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private
    def set_article
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to(articles_url, alert: "ERROR!!") if @article.blank?
    end

    def article_params
      params.require(:article).permit(:title, :body, :tag_id, :photo)
    end
end
