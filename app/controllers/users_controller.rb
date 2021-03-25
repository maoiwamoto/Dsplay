class UsersController < ApplicationController
  
  before_action :authenticate_user!, except: [:show, :index]
  PER = 3
  
  def index
    @users = User.all.page(params[:page]).per(PER)
  end
  
  def mypage
    @user = current_user
  end
  
  def show
      @user = User.find_by(id: params[:id])
      redirect_to(home_path, alert: "ERROR!!") if @user.nil?
  end
  
end
