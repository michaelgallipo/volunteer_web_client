class Client::SessionsController < ApplicationController

  def new
  render 'new.html.erb'
  end

  def create
    client_params = {
     auth: {
      email: params[:email],
      password: params[:password]
      }
     }     

  response = Unirest.post(
    "http://localhost:3000/user_token", 
      parameters: client_params
      )
  
  if response.code == 201
    session[:jwt] = response.body["jwt"]
    user_info = response.body["user"]
    flash[:success] = 'Successfully logged in!'
    redirect_to '/client/organizations'
  else
    flash[:warning] = 'Invalid user name or password!'
    redirect_to '/client/login'
  end
end

def destroy
  session[:jwt] = nil
  flash[:success] = 'Successfully logged out!'
  redirect_to '/client/login'
end
end
