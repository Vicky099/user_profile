class RegistrationsController < Devise::RegistrationsController

	def update
		if current_user.update_attributes(user_params)
			flash[:success] = 'Profile details updated successfully!!'
      		redirect_to dashboards_path
		else
			flash[:danger] = "Something went wrong!!"
      		render action: :edit
		end
	end

	private
  	def user_params
    	params.require(:user).permit(:name, :email, :address)
  	end
end
