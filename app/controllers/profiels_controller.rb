class ProfielsController < ApplicationController
  def create
    user = User.find(params[:id])
    profile = user.profile_messages.build(profile_params)
    profile.save
  end

  def new
    @profile = Profile.new
  end

  def update
    user = User.find(params[:id])
    profile = Profile.find_by(user_id: user.id)
    profile.update(profile_params)

  end


  private

  def profile_params
    params.require(:profile).permit(:content)
  end
end
