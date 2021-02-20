class UsersController < ApplicationController
  
  def mypage
      @user = current_user
  end
  
  def show
      @user = User.find_by(id: params[:id])
      redirect_to(home_path, alert: "ERROR!!　指定したIDのユーザーは存在しません") if @user.nil?
  end
  
end
