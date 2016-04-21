class MyFavoritesController < ApplicationController
	
	def create
		@micropost = Micropost.find(params[:micropost_id])
		current_user.favorite(@micropost)
	end
	
	def destroy
		@micropost = Micropost.find(params[:micropost_id])
		current_user.unfavorite(@micropost)
	end
end
