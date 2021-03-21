class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :her_index]
  before_action :set_post, only: %i[ edit update destroy ]
  PER = 6
  
  def index
      @posts = Post.all.page(params[:page]).per(PER)
  end

  def her_index
      @user = User.find_by(id: params[:id])
      @posts = @user.posts.page(params[:page]).per(PER)
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
          @post.reload
          flash.now[:notice] = '新規投稿を作成しました'
          render :crop
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @post.update_attributes(post_params)
        redirect_to @post, notice: "投稿を更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
  end


  def destroy
    @post.destroy
      redirect_to her_posts_path(current_user.id), notice: "投稿が削除されました"
  end


  private

    def set_post
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to(root_path, alert: "ERROR!!") if @post.blank?
    end

    def post_params
      params.require(:post).permit(:title, :caption, :tag_id, :image, :image_cache, :crop_x, :crop_y, :crop_w, :crop_h)
    end
    
end
