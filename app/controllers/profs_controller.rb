class ProfsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_prof, only: %i[ edit update ]

def edit
end

def update
    if @prof.update(prof_params)
        redirect_to controller: :users, action: :show, id: current_user.id
        flash[:notice] = "プロフィールを更新しました"
    else
        render :edit
    end
end


private

def prof_params
    params.require(:prof).permit(:name, :profile, :avator, :headerimage, :pagetitle, :avator_cache, :headerimage_cache, :remove_avator, :remove_headerimage)
end

def set_prof
    @prof = current_user.prof
end

end
