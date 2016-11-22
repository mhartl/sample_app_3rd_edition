class ProfilesController < ApplicationController
  def create
    user = User.find(params[:id])
    profile = user.profiles.build(profile_params)
    if profile.save
      redirect_to user
    else
      render action: 'new'
    end
  end

  def new
    @profile = Profile.new
  end

  def update
    user = User.find(params[:id])
    profile = Profile.find_by(user_id: user.id)
    if profile.update(profile_params)
      redirect_to user
    else
      render action: 'edit'
    end

  end

  def edit
    @profile = Profile.new
  end


  private

  def profile_params
    params.require(:profile).permit(:content)
  end
end
