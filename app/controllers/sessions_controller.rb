class SessionsController < ApplicationController
	
	def new
	end

	def create
	  @user = User.find_by_email(params[:session][:email])
	  if @user && @user.authenticate(params[:session][:password])
	    session[:user_id] = @user.id
	    redirect_to '/'
	  else
	    redirect_to 'login'
	  	end 
	end
	def destroy 
		current_user.shoppingkarts.delete_all
    	session[:user_id] = nil 
    	session[:order_id] = nil
    	redirect_to '/' 
	end
end
