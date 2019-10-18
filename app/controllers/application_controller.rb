class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resources)
		dashboards_path
	end

	def after_sign_out_path_for(resources)
		new_user_session_path
	end

	def check_authorization
		if current_user.role.to_s != "admin"
			flash[:alert] = "You Don't have access for ths tab."
			redirect_to dashboards_path
		end
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email,:address])
	end
end
