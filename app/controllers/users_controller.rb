class UsersController < ApplicationController
  
  def mypage
    @user = current_user
  end
  
  def edit
    @user = current_user
  end

  def update
   @user = current_user
   @user.update(user_params)
   redirect_to mypage_users_url
  end
  
  def show
      @user = User.find_by(id: params[:id])
      redirect_to(home_path, alert: "ERROR!!　指定したIDのユーザーは存在しません") if @user.nil?
  end

 private
 
   def user_params
     params.permit(:email, :password, :password_confirmation)
   end
  
end
