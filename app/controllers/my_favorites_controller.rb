class MyFavoritesController < ApplicationController
	
	def create
		current_user.my_favorites << Micropost.find(params[:id])
	end
	
	def destroy
		current_user.my_favorites.find_by(micropost_id: params[:id]).destroy
	end
end
