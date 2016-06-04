# app/controllers/users_controller.rb

class UsersController < ApplicationController
	def new
    end

    def create
	    puts 'inicio ============================================'
	    puts user_params[:email]
	    puts 'fin ==============================================='
	    correo = user_params[:email]
	    chek = User.where(email: correo)
	    
	    if chek.nil? || chek.empty?
    		user = User.new(user_params)
			if user.save
				session[:user_id] = user.id
				redirect_to '/sweet'
			else
				redirect_to '/signup'
			end
		else
			redirect_to '/signup'
		end
    end
    
    private

	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end