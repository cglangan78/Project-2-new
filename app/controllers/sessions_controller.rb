class SessionsController < ApplicationController
 def new
 end

 def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id.to_s
    redirect_to root_path
  else
   flash.now.alert = "invalid login credentials"
   render "new"
  end
 end

 def destroy
   session.delete(:user_id)
  redirect_to root_url, notice: "logged out!"
 end

end
