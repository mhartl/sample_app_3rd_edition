class MyFavoritesController < ApplicationController
	
	def create
		@micropost = Micropost.find(params[:micropost_id])
		@user = current_user
		current_user.favorite(@micropost)
	end
	
	def destroy
		@micropost = Micropost.find(params[:micropost_id]).destroy
		@user = current_user
		current_user.unfavorite(@micropost)
	end
end
