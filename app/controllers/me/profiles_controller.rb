class Me::ProfilesController < ApplicationController
    before_action :set_profile, only: %i[ show edit update]

def index
end

def show
    if @profile.nil?
        redirect_to new_me_profile_path
    end
end

def new
    @profile = UserProfile.new
end

def create
    @profile = current_user.build_user_profile(user_profile_params)
    if @profile.save
        redirect_to me_profile_path, notice: "Profile was successfully created."
    else
        render :new
    end
end

def edit
end

def update
    if @profile.update(user_profile_params)
        redirect_to me_profile_path, notice: "Profile was successfully updated."
    else
        render :edit
    end
end


private

def user_profile_params
    params.require(:user_profile).permit(:name, :profile, :avator, :headerimage, :pagetitle, :avator_cache, :headerimage_cache, :remove_avator, :remove_headerimage)
end

def set_profile
    @profile = current_user.user_profile
end
    
end
