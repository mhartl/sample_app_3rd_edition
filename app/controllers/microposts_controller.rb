class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def create_reply
    user = User.find(current_user.id)
    micropost = Micropost.find(params[:id])
    reply = user.microposts.build(micropost_params)
    reply[:in_reply_to] = micropost.id
    binding.pry
    if reply.save
      redirect_to root_url
    end
  end

  def show_reply
    micropost = Micropost.find(params[:id])
    @reply = Micropost.where(in_reply_to: micropost.id)
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
  private
    
    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
