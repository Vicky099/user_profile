class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_authorization
	def index
		@users = User.all.order("id desc")
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "Details updated successfully."
			redirect_to user_path(@user)
		else
			flash[:alert] = "Something went wrong."
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:address, :mobile_number)
	end
end
