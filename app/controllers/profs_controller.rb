class ProfsController < ApplicationController

def new
    @prof = Prof.new
end

def create
    @prof = current_user.prof.new(prof_params)
    if @prof.save
        redirect_to controller: :home, action: :index, notice: "Profile was successfully created."
    else
        render :new
    end
end

def edit
    @prof = current_user.prof
end

def update
    @prof = current_user.prof
    if @prof.update(prof_params)
        redirect_to controller: :home, action: :index, notice: "Profile was successfully updated."
    else
        render :edit
    end
end


private

def prof_params
    params.require(:prof).permit(:name, :profile, :avator, :headerimage, :pagetitle, :avator_cache, :headerimage_cache, :remove_avator, :remove_headerimage)
end

end
