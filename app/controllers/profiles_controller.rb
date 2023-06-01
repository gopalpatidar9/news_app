class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy, :bookmark, :unbookmark]
 
 def index
   @profile = Profile.all
 end   
 def new
   @profile = Profile.new
 end

 def show

 end

def create
  @profile = Profile.new(profile_params)
  if @profile.save
    redirect_to @profile, notice: 'Profile created successfully.'
  else
    render :new, alert: 'Profile creation failed.'
  end
end
    
  def edit
    @user = current_user
  end
    
  def update
    @user = current_user
    if @user.update(user_params)
        redirect_to edit_profile_path, notice: 'Profile updated successfully.'
    else
        render :edit
    end
  end

  def show_user_profile
    @profile = Profile.find(params[:id])
  end

 


  private
    
    def set_profile
      @profile = Profile.find(params[:id])
    end
    
    def profile_params
      params.require(:profile).permit(:name , :gander , :bio , :avtar , :user_id , :address)
    end     
end
