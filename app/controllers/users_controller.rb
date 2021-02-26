class UsersController < ApplicationController
  
  before_action :authenticate_user!, except: [:show]
  
  def mypage
  end
  
  def show
      @user = User.find_by(id: params[:id])
      redirect_to(home_path, alert: "ERROR!!") if @user.nil?
  end
  
end
