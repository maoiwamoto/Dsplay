class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, only: %i[ edit update destroy ]

 
  def index
      @user = User.find_by(id: params[:id])
      @posts = @user.posts
  end


  def show
     @post = Post.find_by(id: params[:id])
  end


  def new
    @post = current_user.posts.new
  end
  
  def edit
  end

  def create
    
      @post = current_user.posts.new(post_params)
      if @post.save
        if params[:post][:image].present?
          render :crop
        else
         redirect_to @post, notice: "Post was successfully created."
        end
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @post.update_attributes(post_params)
      if params[:post][:image].present?
        render :crop
      else
        redirect_to @post, notice: "Post was successfully updated."
      end
      else
        render :edit, status: :unprocessable_entity
      end
  end


  def destroy
    @post.destroy
      redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private

    def set_post
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to(posts_url, alert: "ERROR!!") if @post.blank?
    end

    def post_params
      params.require(:post).permit(:title, :caption, :tag_id, :image, :image_cache, :crop_x, :crop_y, :crop_w, :crop_h)
    end
    
end
