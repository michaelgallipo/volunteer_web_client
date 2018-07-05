class Client::UsersController < ApplicationController

  def show
    user_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/users/#{user_id}")
    @user = response.body
    render "show.html.erb"

  end

  def new
    @user = {
      "full_name" => params[:full_name],
      "user_name" => params[:user_name],
      "password" => params[:password],
      "address" => params[:address],
      "email" => params[:email],
      "phone" => params[:phone],
      "visibility" => params[:visibility],
      "bio" => params[:bio],
      "skills" => params[:skills],
    }

    render "new.html.erb"
  end

  def create
     @user = {
      "full_name" => params[:full_name],
      "user_name" => params[:user_name],
      "password" => params[:password],
      "address" => params[:address],
      "email" => params[:email],
      "phone" => params[:phone],
      "visibility" => params[:visibility],
      "bio" => params[:bio],
      "skills" => params[:skills],
    }
    
    response = Unirest.post("https://localhost:3000/api/users", parameters: @user) 

    if response.code == 200
      flash[:message] = "User Account sucessfully created"
      redirect_to "/client/users/#{@user[:id]}"
    else
      @errors = response.body['errors']
      render "new.html.erb"
    end  
  end

end
