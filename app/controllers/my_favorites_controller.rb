class MyFavoritesController < ApplicationController
	
	def create
		@micropost = Micropost.find(params[:micropost_id])
		@user = current_user
		current_user.favorite(@micropost)
		respond_to do |format|
			format.html { redirect_to root_url }
			format.js
		end
	end
	
	def destroy
		@micropost = Micropost.find(params[:micropost_id])
		@user = current_user
		current_user.unfavorite(@micropost)
		respond_to do |format|
			format.html { redirect_to root_url }
			format.js
		end
	end
end
