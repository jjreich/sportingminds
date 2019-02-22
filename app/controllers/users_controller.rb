class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def index
      	@users = User.all

      	currentUserArray = [current_user]
      	@availableAccountabilityPartners = User.all - current_user.accountability_partners - currentUserArray

    end
end
