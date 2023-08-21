# class SessionsController < ApplicationController 
#   def create 
#     user = User.find_by(email: params[:email]) 

#     if user && user.authenticate(params[:password]) 
#       session[:user_id]= user_id 
#       redirect_to root_path, notice: 'logged in successfully'
#     else 
      
#     end
#   end

#   def destroy 
#     session.delete(:current_user_id)
#     session[:user_id] = nil 
#     redirect_to root_path, notice: 'logged out'
#   end

# end
